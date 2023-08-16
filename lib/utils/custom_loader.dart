// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:task1/utils/common_colors.dart';
import 'package:task1/utils/common_logics.dart';
import 'package:task1/utils/screen_constants.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatefulWidget {
  final Color color;
  final Color? bgColor;
  final bool isCompact;

  const CustomLoader({
    Key? key,
    this.color = CommonColors.colorOrangeShade2,
    this.bgColor,
    this.isCompact = false,
  }) : super(key: key);

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isCompact ? null : MediaQuery.of(context).size.height,
      width: widget.isCompact ? null : MediaQuery.of(context).size.width,
      color: widget.bgColor ?? (isDarkTheme(context)
          ? CommonColors.colorBlackShade1
          : CommonColors.colorGreyShade1),
      child: Center(
          child: Container(
              constraints: BoxConstraints(
                maxHeight: ScreenConstant.size80,
                maxWidth: ScreenConstant.size80,
                minHeight: ScreenConstant.size60,
                minWidth: ScreenConstant.size60,
              ),
              child: Center(
                child: SpinKitFadingCircle(
                  duration: const Duration(milliseconds: 1300),
                  color: widget.color,
                  size: ScreenConstant.size60,
                ),
              ))),
    );
  }
}
