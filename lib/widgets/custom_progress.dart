import 'package:flutter/cupertino.dart';
import '/core/app_export.dart';

class CustomProgressButton extends StatelessWidget {
  const CustomProgressButton({
    super.key,
    this.lable = '',
    this.textColor,
    this.fontSize,
    this.indicatorColor = const Color(0XFFFFFFFF),
    this.style,
    this.indicator = true,
    this.textAlign= TextAlign.center,
  });
  final bool indicator;
  final String lable;
  final Color? textColor, indicatorColor;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (indicator)
          CupertinoActivityIndicator(
            color: indicatorColor,
          ),
        if (indicator) SizedBox(width: 4.adaptSize),
        Text(
          lable,
          textAlign: textAlign,
          style: style ??
              TextStyle(
                fontSize: fontSize,
                color: indicatorColor,
              ),
        ),
        SizedBox(
          width: 12.adaptSize,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                '...',
                textStyle: style ??
                    TextStyle(
                      fontSize: fontSize,
                      color: textColor,
                    ),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
