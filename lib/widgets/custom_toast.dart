import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ToastOptions {
  final EdgeInsets insetPadding;
  final Duration? close;
  final bool canPop;
  final Color? backgroundColor;

  ToastOptions({
    this.close,
    this.backgroundColor,
    this.canPop = true,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  });
}

class AnimatedAlertDialog extends StatefulWidget {
  final ToastOptions options;
  final Widget content;
  const AnimatedAlertDialog({
    super.key,
    required this.options,
    required this.content,
  });

  @override
  AnimatedAlertDialogState createState() => AnimatedAlertDialogState();
}

class AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late ToastOptions options;

  @override
  void initState() {
    super.initState();
    options = widget.options;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    if (options.close != null) {
      Future.delayed(options.close!, () {
        if (mounted) Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: PopScope(
            canPop: options.canPop,
            child: AlertDialog(
              insetPadding: options.insetPadding,
              content: widget.content,
              backgroundColor: options.backgroundColor,
            ),
          ),
        );
      },
    );
  }
}

enum ToastType {
  success,
  error,
  warning,
  info,
  checked,
}

class Toasts {
  static Widget content({
    required ToastType type,
    bool? successfull,
    bool back = true,
    String? message,
  }) {
    Widget icon = const SizedBox();
    Widget text = const SizedBox();

    if (type == ToastType.success) {
      icon = Icon(
        Icons.check_circle,
        size: 60.v,
        color: appTheme.primary,
      );
      text = Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: appTheme.primary,
          fontSize: 14.fSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (type == ToastType.error) {
      icon = Icon(
        Icons.close_rounded,
        size: 60.v,
        color: appTheme.icon,
      );
      text = Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: appTheme.text,
          fontSize: 14.fSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (type == ToastType.warning) {
      icon = Icon(
        Icons.warning_amber,
        size: 60.v,
        color: appTheme.yellow80001,
      );
      text = Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: appTheme.yellow80001,
          fontSize: 14.fSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (type == ToastType.info) {
      icon = Icon(
        Icons.info_outline,
        size: 60.v,
        color: appTheme.primary,
      );
      text = Text(
        message ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: appTheme.primary,
          fontSize: 14.fSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (type == ToastType.checked) {
      if (successfull == true) {
        icon = Icon(
          Icons.check_circle,
          size: 60.v,
          color: appTheme.whiteFdedf8,
        );
        text = Text(
          message ?? '',
          style: TextStyle(
            color: appTheme.whiteFdedf8,
            fontSize: 14.fSize,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        icon = Icon(
          Icons.close_rounded,
          size: 60.v,
          color: appTheme.whiteFdedf8,
        );
        text = Text(
          message ?? '',
          style: TextStyle(
            color: appTheme.whiteFdedf8,
            fontSize: 14.fSize,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (back) Get.back();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [icon, text],
      ),
    );
  }

  static success({String? message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(
          options: ToastOptions(
            backgroundColor: appTheme.whiteA700,
            insetPadding: EdgeInsets.symmetric(horizontal: 50.h),
          ),
          content: content(
            type: ToastType.success,
            message: message,
          ),
        );
      },
    );
  }

  static error({String? message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(
          options: ToastOptions(
            backgroundColor: appTheme.error,
            insetPadding: EdgeInsets.symmetric(horizontal: 50.h),
          ),
          content: content(
            type: ToastType.error,
            message: message,
          ),
        );
      },
    );
  }

  static warning({String? message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(
          options: ToastOptions(
            backgroundColor: appTheme.whiteA700,
            insetPadding: EdgeInsets.symmetric(horizontal: 50.h),
          ),
          content: content(
            type: ToastType.warning,
            message: message,
          ),
        );
      },
    );
  }

  static info({String? message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(
          options: ToastOptions(
            backgroundColor: appTheme.lightGreen50,
            insetPadding: EdgeInsets.symmetric(horizontal: 50.h),
          ),
          content: content(
            type: ToastType.info,
            message: message,
          ),
        );
      },
    );
  }

  static checked({bool successfull = true, String? message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(
          options: ToastOptions(
            canPop: false,
            close: const Duration(seconds: 3),
            backgroundColor: successfull ? appTheme.primary : appTheme.red600,
            insetPadding: EdgeInsets.symmetric(horizontal: 120.h),
          ),
          content: content(
            back: false,
            type: ToastType.checked,
            successfull: successfull,
            message: message,
          ),
        );
      },
    );
  }
}
