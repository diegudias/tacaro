import 'package:flutter/material.dart';

import '/shared/themes/app_theme.dart';
enum ButtonType { fill, outline, none }

class Button extends StatelessWidget {
  final String label;
  final ButtonType type;
  const Button({
    Key? key,
    required this.label,
    this.type = ButtonType.fill,
  }) : super(key: key);

  TextStyle get textStyle {
    switch (type) {
      case ButtonType.fill:
        return AppTheme.textStyles.buttonBackgroundColor;
      case ButtonType.outline:
        return AppTheme.textStyles.buttonBoldTextColor;
      case ButtonType.none:
        return AppTheme.textStyles.buttonTextColor;
      default:
        throw "INVALID BUTTON TYPE";
    }
  }

  BoxDecoration get boxDecoration {
    switch (type) {
      case ButtonType.fill:
        return BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(10));
      case ButtonType.outline:
        return BoxDecoration(
            color: Colors.transparent,
            border: Border.fromBorderSide(
                BorderSide(color: AppTheme.colors.border, width: 1.5)),
            borderRadius: BorderRadius.circular(10));
      case ButtonType.none:
        return BoxDecoration(
          color: Colors.transparent,
          //borderRadius: BorderRadius.circular(10)
        );
      default:
        throw "INVALID BUTTON TYPE";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        print("CLICK");
      },
      child: Container(
        height: 58,
        width: double.maxFinite,
        decoration: boxDecoration,
        child: Center(
            child: Text(
          label,
          style: textStyle,
        )),
      ),
    );
  }
}