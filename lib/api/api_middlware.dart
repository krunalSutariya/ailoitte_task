import 'dart:convert';
import 'dart:io';

import 'package:ailoitte_task/utils/enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/api_end_point.dart';

class ApiMiddleware {
  ApiMiddleware._();

  static ApiMiddleware instance = ApiMiddleware._();

  final Dio _dio = Dio();

  // Get Header...
  Map<String, String> get getHeader {
    final Map<String, String> header = {'Content-Type': 'application/json'};

    return header;
  }

  // Call API Service...
  Future<Response> callService({
    required String endPoint,
    NetworkCallType networkCallType = NetworkCallType.GET,
    required Map<String, dynamic> parms,
  }) async {
    try {
      _dio.options.baseUrl = APISetup.productionURL;

      _dio.options.followRedirects = false;
      _dio.options.headers[HttpHeaders.acceptHeader] = getHeader;
      _dio.options.validateStatus = (status) => status! <= 500;

      _dio.transformer = JsonTransformer();

      //setup auth interceptor
      _setupAuthInterceptor();

      //setup log interceptor
      _setupLogInterceptor();

      switch (networkCallType) {
        case NetworkCallType.POST:
          return await _dio.post(endPoint, data: parms);

        case NetworkCallType.GET:
          return await _dio.get(endPoint, queryParameters: parms);

        case NetworkCallType.PATCH:
          return await _dio.patch(endPoint, data: parms);

        case NetworkCallType.DELETE:
          return await _dio.delete(endPoint, data: parms);
      }
    } on FormatException catch (e) {
      throw e.message;
    } catch (error) {
      rethrow;
    }
  }

  _setupAuthInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(DioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      if (e.type == DioErrorType.response) {
        switch (e.response!.statusCode) {
          case 401:
            break;
          case 403:
            _showToast("403 Forbidden");
            break;
          case 404:
            _showToast("404 Forbidden");
            break;
          case 429:
            _showToast(
                "Too many requests - ${e.requestOptions.uri.toString()}");
            break;
          case 500:
            _showToast("500 Server Broken");
            break;
          case 405:
            _showToast("405 Method Not Allowed");
            break;
        }
      } else {
        _showToast(e.message);
      }
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
  }

  _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  _setupLogInterceptor() {
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: false));
    }
  }
}

//This transformer runs the json decoding in a background thread.
//Thus returing a Future of Map
class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response);
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}
