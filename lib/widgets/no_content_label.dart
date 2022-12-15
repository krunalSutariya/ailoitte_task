import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../widgets/custom_text.dart';

class NoContentLabel extends StatelessWidget {
  const NoContentLabel({
    Key? key,
    required this.title,
    this.style,
   required this.padding,
    this.onPress,
  }) : super(key: key);
  final String title;
  final TextStyle? style;
  final EdgeInsetsGeometry padding;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              txtTitle: title,
              align: TextAlign.center,
              style: style ??
                  Theme.of(context).textTheme.headline6?.copyWith(
                      color: const Color.fromARGB(255, 3, 17, 38),
                      fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            if (onPress == null)
              const SizedBox()
            else
              TextButton(
                onPressed: onPress,
                child: const CustomText(
                  txtTitle: StaticString.retry,
                  align: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
