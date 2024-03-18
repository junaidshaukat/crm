import 'package:flutter/material.dart';
import '/core/app_export.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({
    super.key,
    required this.tryAgain,
    this.message,
  });
  final String? message;
  final Future<void> Function() tryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator.adaptive(
        onRefresh: tryAgain,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (message != null) Text(message!),
            GestureDetector(
              onTap: tryAgain,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: appTheme.red900),
                    SizedBox(width: 8.adaptSize),
                    Text(
                      'try_again'.tr,
                      style: TextStyle(
                        color: appTheme.red900,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
