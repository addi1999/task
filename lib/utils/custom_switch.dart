import 'package:flutter/material.dart';
import 'package:task1/utils/common_colors.dart';
import 'package:task1/utils/common_logics.dart';
import 'package:task1/utils/screen_constants.dart';


class CustomSwitch extends StatelessWidget {
  final Function onTap;
  final bool value;
  final Color color;

  const CustomSwitch({
    Key? key,
    required this.onTap,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: ScreenConstant.size18,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenConstant.size14,
                  width: ScreenConstant.size40,
                  decoration: BoxDecoration(
                    color: value ? color : CommonColors.colorGreyShade8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: value ? 0 : null,
              left: value ? null : 0,
              child: Column(
                children: [
                  Container(
                    height: ScreenConstant.size18,
                    width: ScreenConstant.size18,
                    padding: EdgeInsets.all(ScreenConstant.size4),
                    decoration: BoxDecoration(
                      color: isDarkTheme(context) ? CommonColors.colorBlackShade1: CommonColors.colorWhiteShade1,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: value ? color : isDarkTheme(context) ? CommonColors.colorWhiteShade1: CommonColors.colorBlackShade1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: value ? color : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
