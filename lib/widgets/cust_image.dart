import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/img_constants.dart';
import '../utils/custom_extension.dart';

class CustImage extends StatelessWidget {
  final String imgURL;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final String errorImage;
  final BoxFit boxfit;

  const CustImage({
    Key? key,
    this.imgURL = "",
    this.cornerRadius = 0,
    this.height,
    this.width,
    this.boxfit = BoxFit.contain,
    this.errorImage = ImgName.errorIcon,
  }) : super(key: key);

  Widget defaultImg(BuildContext context) => Image.asset(
        errorImage,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          errorImage,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        fit: BoxFit.cover,
        height: height,
        width: width,
      );

  @override
  Widget build(BuildContext context) {
    Widget image = defaultImg(context);
    if (imgURL.isNotEmpty) {
      // Check if Network image...
      if (imgURL.isNetworkImage) {
        image = _cacheImage(context);

        // Check if Asset image...
      } else if (isAssetImage(imgURL)) {
        image = imgURL.contains(".svg")
            ? SvgPicture.asset(
                imgURL,
                fit: boxfit,
                height: height,
                width: width,
              )
            : Image.asset(
                imgURL,
                height: height,
                width: width,
                errorBuilder: (context, error, stackTrace) =>
                    defaultImg(context),
                fit: boxfit,
              );

        // Check if File image...
      } else if (isFileImage(imgURL)) {
        image = Image.file(
          File(imgURL),
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) => defaultImg(context),
        );
      }
    }

    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(cornerRadius ?? 0.0),
        ),
      ),
      height: height,
      width: width,
      child: image,
    );
  }

  Widget _cacheImage(BuildContext context) {
    return imgURL.contains(".svg")
        ? SvgPicture.network(
            imgURL,
            fit: boxfit,
            height: height,
            width: width,
            placeholderBuilder: (context) => defaultImg(context),
          )
        : CachedNetworkImage(
            fit: boxfit,
            imageUrl: imgURL,
            height: height,
            width: width,
            placeholder: (context, url) => shimmerWidget(),
            errorWidget: (ctx, url, obj) => defaultImg(context),
          );
  }

  Widget shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade500,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  bool isAssetImage(String url) => url.toLowerCase().contains(ImgName.imgPath);

  bool isFileImage(String url) => !isAssetImage(url);
}
