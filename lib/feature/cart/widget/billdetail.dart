

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task1/utils/text_styles.dart';

import '../../../utils/common_colors.dart';

class Billdetail extends StatelessWidget {
  Billdetail({
    super.key,
    this.text,
    this.text2,
  });

  String? text;
  String? text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text!,
          style: TextStyles.textStyleBold16
              .copyWith(color: CommonColors.colorGreyShade14),
        ),
        Text(
          "₹$text2",
          style: TextStyles.textStyleBold16
              .copyWith(color: CommonColors.colorBlackShade2),
        ),
      ],
    );
  }
}
