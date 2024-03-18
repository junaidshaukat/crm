// import 'dart:async';
// import '/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' as math;

// /// Alert Type
// enum QuickAlertType {
//   /// success alert type
//   success,

//   /// error alert type
//   error,

//   /// warning alert type
//   warning,

//   /// confirm alert type
//   confirm,

//   /// info alert type
//   info,

//   /// loading alert type
//   loading,

//   /// custom alert type
//   custom,
// }

// /// Animation Type
// enum QuickAlertAnimType {
//   /// scale animation
//   scale,

//   /// rotate animation
//   rotate,

//   /// slideInDown animation
//   slideInDown,

//   /// slideInUp animation
//   slideInUp,

//   /// slideInLeft animation
//   slideInLeft,

//   /// slideInRight animation
//   slideInRight,
// }

// /// Alert Options
// class QuickAlertOptions {
//   /// Title of the dialog
//   String? title;

//   /// Text of the dialog
//   String? text;

//   /// TitleAlignment of the dialog
//   TextAlign? titleAlignment;

//   /// TextAlignment of the dialog
//   TextAlign? textAlignment;

//   /// Custom Widget of the dialog
//   Widget? widget;

//   /// Alert type [success, error, warning, confirm, info, loading, custom]
//   QuickAlertType type;

//   /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
//   QuickAlertAnimType? animType;

//   /// Barrier dismissible
//   bool? barrierDismissible = false;

//   /// Triggered when confirm button is tapped
//   VoidCallback? onConfirmBtnTap;

//   /// Triggered when cancel button is tapped
//   VoidCallback? onCancelBtnTap;

//   /// Confirmation button text
//   String? confirmBtnText;

//   /// Cancel button text
//   String? cancelBtnText;

//   /// Color for confirm button
//   Color? confirmBtnColor;

//   /// TextStyle for confirm button
//   TextStyle? confirmBtnTextStyle;

//   /// TextStyle for cancel button
//   TextStyle? cancelBtnTextStyle;

//   /// Backgroung Color for dialog
//   Color? backgroundColor;

//   /// Header Backgroung Color for dialog
//   Color? headerBackgroundColor;

//   /// Color of title
//   Color? titleColor;

//   /// Color of text
//   Color? textColor;

//   /// Determines if cancel button is shown or not
//   bool? showCancelBtn;

//   /// Determines if confirm button is shown or not
//   bool? showConfirmBtn;

//   /// Dialog Border Radius
//   double? borderRadius;

//   /// Asset path of your Image file
//   String? customAsset;

//   /// Width of the dialog
//   double? width;

//   /// timer for dismissing dialog (Ok button)
//   Timer? timer;

//   //  icon? icon;
//   Widget? icon;

//   /// Alert Options
//   QuickAlertOptions({
//     /// Title of the dialog
//     this.title,

//     /// Text of the dialog
//     this.text,

//     /// TitleAlignment of the dialog
//     this.titleAlignment,

//     /// TextAlignment of the dialog
//     this.textAlignment,

//     /// Custom Widget of the dialog
//     this.widget,

//     /// Alert type [success, error, warning, confirm, info, loading, custom]
//     required this.type,

//     /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
//     this.animType,

//     /// Barrier Dissmisable
//     this.barrierDismissible,

//     /// Triggered when confirm button is tapped
//     this.onConfirmBtnTap,

//     /// Triggered when cancel button is tapped
//     this.onCancelBtnTap,

//     /// Confirmation button text
//     this.confirmBtnText,

//     /// Cancel button text
//     this.cancelBtnText,

//     /// Color for confirm button
//     this.confirmBtnColor,

//     /// TextStyle for confirm button
//     this.confirmBtnTextStyle,

//     /// TextStyle for cancel button
//     this.cancelBtnTextStyle,

//     /// Backgroung Color for dialog
//     this.backgroundColor,

//     /// Header Backgroung Color for dialog
//     this.headerBackgroundColor,

//     /// Color of title
//     this.titleColor,

//     /// Color of text
//     this.textColor,

//     /// Determines if cancel button is shown or not
//     this.showCancelBtn,

//     /// Determines if confirm button is shown or not
//     this.showConfirmBtn,

//     /// Dialog Border Radius
//     this.borderRadius,

//     /// Asset path of your Image file
//     this.customAsset,

//     /// Width of the dialog
//     this.width,

//     /// timer for dismissing dialog (Ok button)
//     this.timer,

//     /// icon
//     this.icon,
//   });
// }

// /// Define Animation Type
// class Animate {
//   /// scale Animation
//   static Transform scale({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation<double> animation,
//   }) {
//     return Transform.scale(
//       scale: animation.value,
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }

//   /// rotate Animation
//   static Transform rotate({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation<double> animation,
//   }) {
//     return Transform.rotate(
//       angle: math.radians(animation.value * 360),
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }

//   /// slideInDown Animation
//   static Transform slideInDown({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation<double> animation,
//   }) {
//     final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
//     return Transform(
//       transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }

//   /// slideInUp Animation
//   static Transform slideInUp({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation<double> animation,
//   }) {
//     final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
//     return Transform(
//       transform: Matrix4.translationValues(0.0, curvedValue * -200, 0.0),
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }

//   /// slideInLeft Animation
//   static Transform slideInLeft({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation<double> animation,
//   }) {
//     final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
//     return Transform(
//       transform: Matrix4.translationValues(curvedValue * 200, 0.0, 0.0),
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }

//   /// slideInRight Animation
//   static Transform slideInRight({
//     /// child
//     required Widget child,

//     /// animation
//     required Animation animation,
//   }) {
//     final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
//     return Transform(
//       transform: Matrix4.translationValues(curvedValue * -200, 0, 0),
//       child: Opacity(
//         opacity: animation.value,
//         child: child,
//       ),
//     );
//   }
// }

// /// Define Animation Type
// class AppAnim {
//   /// Loading Animation
//   static const loading = 'assets/gif/loading.gif';

//   /// Success Animation
//   static const success = 'assets/gif/success.png';

//   /// Error Animation
//   static const error = 'assets/gif/error.gif';

//   /// Warning Animation
//   static const warning = 'assets/gif/warning.gif';

//   /// Info Animation
//   static const info = 'assets/gif/info.gif';

//   /// Confirm Animation
//   static const confirm = 'assets/gif/confirm.gif';
// }

// class QuickAlertButtons extends StatelessWidget {
//   final QuickAlertOptions? options;

//   const QuickAlertButtons({
//     super.key,
//     this.options,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 0.0), //default 10
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           cancelBtn(context),
//           okayBtn(context),
//         ],
//       ),
//     );
//   }

//   Widget okayBtn(context) {
//     if (!options!.showConfirmBtn!) {
//       return const SizedBox();
//     }
//     final showCancelBtn = options!.type == QuickAlertType.confirm
//         ? true
//         : options!.showCancelBtn!;

//     final okayBtn = buildButton(
//         context: context,
//         isOkayBtn: true,
//         text: options!.confirmBtnText!,
//         onTap: () {
//           options!.timer?.cancel();
//           options!.onConfirmBtnTap != null
//               ? options!.onConfirmBtnTap!()
//               : Navigator.pop(context);
//         });

//     if (showCancelBtn) {
//       return Expanded(child: okayBtn);
//     } else {
//       return okayBtn;
//     }
//   }

//   Widget cancelBtn(context) {
//     final showCancelBtn = options!.type == QuickAlertType.confirm
//         ? true
//         : options!.showCancelBtn!;

//     final cancelBtn = buildButton(
//         context: context,
//         isOkayBtn: false,
//         text: options!.cancelBtnText!,
//         onTap: () {
//           options!.timer?.cancel();
//           options!.onCancelBtnTap != null
//               ? options!.onCancelBtnTap!()
//               : Navigator.pop(context);
//         });

//     if (showCancelBtn) {
//       return Expanded(child: cancelBtn);
//     } else {
//       return const SizedBox();
//     }
//   }

//   Widget buildButton({
//     BuildContext? context,
//     required bool isOkayBtn,
//     required String text,
//     VoidCallback? onTap,
//   }) {
//     final btnText = Text(
//       text,
//       style: defaultTextStyle(isOkayBtn),
//     );

//     final okayBtn = MaterialButton(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       color: options!.confirmBtnColor ?? Theme.of(context!).primaryColor,
//       onPressed: onTap,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(4),
//           child: btnText,
//         ),
//       ),
//     );

//     final cancelBtn = GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: btnText,
//       ),
//     );

//     return isOkayBtn ? okayBtn : cancelBtn;
//   }

//   TextStyle defaultTextStyle(bool isOkayBtn) {
//     final textStyle = TextStyle(
//       color: isOkayBtn ? Colors.white : Colors.grey,
//       fontWeight: FontWeight.w600,
//       fontSize: 12.0,
//     );

//     if (isOkayBtn) {
//       return options!.confirmBtnTextStyle ?? textStyle;
//     } else {
//       return options!.cancelBtnTextStyle ?? textStyle;
//     }
//   }
// }

// class QuickAlertContainer extends StatelessWidget {
//   final QuickAlertOptions? options;

//   const QuickAlertContainer({
//     super.key,
//     this.options,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final header = buildHeader(context);
//     final title = buildTitle(context);
//     final text = buildText(context);
//     final buttons = buildButtons();
//     final widget = buildWidget(context);

//     final content = Container(
//       padding: const EdgeInsets.all(0.0), //default  20
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (options?.title != null) title,
//           if (options?.text != null)
//             const SizedBox(
//               height: 5.0,
//             ),
//           if (options?.text != null) text,
//           if (options?.widget != null) widget!,
//           if (options?.confirmBtnText != null || options?.cancelBtnText != null)
//             const SizedBox(
//               height: 10.0,
//             ),
//           if (options?.confirmBtnText != null || options?.cancelBtnText != null)
//             buttons
//         ],
//       ),
//     );

//     return Container(
//       width: options!.width,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: options!.backgroundColor,
//         borderRadius: BorderRadius.circular(options!.borderRadius!),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [header, content],
//       ),
//     );
//   }

//   Widget buildHeader(context) {
//     String? anim = AppAnim.success;
//     switch (options!.type) {
//       case QuickAlertType.success:
//         anim = AppAnim.success;
//         break;
//       case QuickAlertType.error:
//         anim = AppAnim.error;
//         break;
//       case QuickAlertType.warning:
//         anim = AppAnim.warning;
//         break;
//       case QuickAlertType.confirm:
//         anim = AppAnim.confirm;
//         break;
//       case QuickAlertType.info:
//         anim = AppAnim.info;
//         break;
//       case QuickAlertType.loading:
//         anim = AppAnim.loading;
//         break;
//       default:
//         anim = AppAnim.info;
//         break;
//     }

//     if (options!.customAsset != null) {
//       anim = options!.customAsset;
//     }

//     if (options?.icon != null) {
//       return options!.icon!;
//     } else {
//       return Container(
//         width: double.infinity,
//         height: 150,
//         clipBehavior: Clip.antiAlias,
//         padding: EdgeInsets.all(34.adaptSize),
//         decoration: BoxDecoration(
//           color: options!.headerBackgroundColor,
//         ),
//         child: Image.asset(
//           anim ?? "",
//           fit: BoxFit.cover,
//         ),
//       );
//     }
//   }

//   Widget buildTitle(context) {
//     final title = options!.title ?? whatTitle();
//     return Visibility(
//       visible: title != null,
//       child: Text(
//         '$title',
//         textAlign: options!.titleAlignment ?? TextAlign.center,
//         style: TextStyle(
//           color: options!.titleColor,
//         ).merge(
//           Theme.of(context).textTheme.headlineSmall,
//         ),
//       ),
//     );
//   }

//   Widget buildText(context) {
//     if (options!.text == null && options!.type != QuickAlertType.loading) {
//       return Container();
//     } else {
//       String? text = '';
//       if (options!.type == QuickAlertType.loading) {
//         text = options!.text ?? 'Loading';
//       } else {
//         text = options!.text;
//       }
//       return Text(
//         text ?? '',
//         textAlign: options!.textAlignment ?? TextAlign.center,
//         style: TextStyle(
//           color: options!.textColor,
//         ),
//       );
//     }
//   }

//   Widget? buildWidget(context) {
//     if (options!.widget == null && options!.type != QuickAlertType.custom) {
//       return Container();
//     } else {
//       Widget widget = Container();
//       if (options!.type == QuickAlertType.custom) {
//         widget = options!.widget ?? widget;
//       }
//       return options!.widget;
//     }
//   }

//   Widget buildButtons() {
//     if (options!.type == QuickAlertType.loading) {
//       return Container();
//     } else {
//       return QuickAlertButtons(
//         options: options,
//       );
//     }
//   }

//   String? whatTitle() {
//     switch (options!.type) {
//       case QuickAlertType.success:
//         return 'Success';
//       case QuickAlertType.error:
//         return 'Error';
//       case QuickAlertType.warning:
//         return 'Warning';
//       case QuickAlertType.confirm:
//         return 'Are You Sure?';
//       case QuickAlertType.info:
//         return 'Info';
//       case QuickAlertType.custom:
//         return null;
//       case QuickAlertType.loading:
//         return null;
//       default:
//         return null;
//     }
//   }
// }

// /// QuickAlert
// class QuickAlert {
//   /// Instantly display animated alert dialogs such as success, error, warning, confirm, loading or even a custom dialog.
//   static Future show({
//     /// BuildContext
//     required BuildContext context,

//     /// Title of the dialog
//     String? title,

//     /// Title of the dialog
//     Widget? icon,

//     /// Text of the dialog
//     String? text,

//     /// TitleAlignment of the dialog
//     TextAlign? titleAlignment,

//     /// TextAlignment of the dialog
//     TextAlign? textAlignment,

//     /// Custom Widget of the dialog
//     Widget? widget,

//     /// Alert type [success, error, warning, confirm, info, loading, custom]
//     required QuickAlertType type,

//     /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,

//     /// Barrier Dismissible
//     bool barrierDismissible = true,

//     /// Triggered when confirm button is tapped
//     VoidCallback? onConfirmBtnTap,

//     /// Triggered when cancel button is tapped
//     VoidCallback? onCancelBtnTap,

//     /// Confirmation button text
//     String? confirmBtnText,

//     /// Cancel button text
//     String? cancelBtnText,

//     /// Color for confirm button
//     Color confirmBtnColor = const Color(0XFF007C16),

//     /// TextStyle for confirm button
//     TextStyle? confirmBtnTextStyle,

//     /// TextStyle for cancel button
//     TextStyle? cancelBtnTextStyle,

//     /// Background Color for dialog
//     Color backgroundColor = Colors.white,

//     /// Header Background Color for dialog
//     Color headerBackgroundColor = const Color(0XFF007C16),

//     /// Color of title
//     Color titleColor = Colors.black,

//     /// Color of text
//     Color textColor = Colors.black,

//     /// Barrier Color of dialog
//     Color? barrierColor,

//     /// Determines if cancel button is shown or not
//     bool showCancelBtn = false,

//     /// Determines if confirm button is shown or not
//     bool showConfirmBtn = true,

//     /// Dialog Border Radius
//     double borderRadius = 15.0,

//     /// Asset path of your Image file
//     String? customAsset,

//     /// Width of the dialog
//     double? width,

//     /// Determines how long the dialog stays open for before closing, [default] is null. When it is null, it won't auto close
//     Duration? autoCloseDuration,

//     /// Disable Back Button
//     bool disableBackBtn = false,
//   }) {
//     Timer? timer;
//     if (autoCloseDuration != null) {
//       timer = Timer(autoCloseDuration, () {
//         Navigator.of(context, rootNavigator: true).pop();
//       });
//     }

//     final options = QuickAlertOptions(
//       timer: timer,
//       title: title,
//       text: text,
//       icon: icon,
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       type: type,
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//     );

//     final child = PopScope(
//       canPop: true,
//       onPopInvoked: (didPop) => Future.value(!disableBackBtn),
//       child: AlertDialog(
//         contentPadding: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         content: QuickAlertContainer(
//           options: options,
//         ),
//       ),
//     );

//     return showGeneralDialog(
//       barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
//       transitionBuilder: (context, anim1, __, widget) {
//         switch (animType) {
//           case QuickAlertAnimType.scale:
//             return Animate.scale(child: child, animation: anim1);

//           case QuickAlertAnimType.rotate:
//             return Animate.rotate(child: child, animation: anim1);

//           case QuickAlertAnimType.slideInDown:
//             return Animate.slideInDown(child: child, animation: anim1);

//           case QuickAlertAnimType.slideInUp:
//             return Animate.slideInUp(child: child, animation: anim1);

//           case QuickAlertAnimType.slideInLeft:
//             return Animate.slideInLeft(child: child, animation: anim1);

//           case QuickAlertAnimType.slideInRight:
//             return Animate.slideInRight(child: child, animation: anim1);

//           default:
//             return child;
//         }
//       },
//       transitionDuration: const Duration(milliseconds: 200),
//       barrierDismissible:
//           autoCloseDuration != null ? false : barrierDismissible,
//       barrierLabel: '',
//       context: context,
//       pageBuilder: (context, _, __) => Container(),
//     );
//   }
// }

// enum AlertType { toast, error, success, warning, info }

// class Alert {
//   static buildIcon({
//     IconData? icon,
//     double? size = 60,
//     Color? color = const Color(0XFF007C16),
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(top: 24.h),
//       child: Icon(
//         icon,
//         size: size,
//         color: color,
//       ),
//     );
//   }

//   static confirm({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = Colors.white,
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.check_circle_rounded,
//     double? size = 60,
//     Color? color = const Color(0XFF007C16),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.confirm,
//       title: title,
//       text: message,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }

//   static custom({
//     String? title,
//     String? message,
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     AlertType type = AlertType.success,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String? confirmBtnText,
//     String? cancelBtnText,
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = const Color(0XFF007C16),
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = false,
//     double borderRadius = 15.0,
//     String? customAsset,
//     Duration? autoCloseDuration = const Duration(milliseconds: 1500),
//   }) {
//     Widget? widget = const SizedBox();

//     if (type == AlertType.success) {
//       widget = Column(
//         children: [
//           Icon(
//             size: 48.v,
//             color: Colors.white,
//             Icons.check_circle_rounded,
//           ),
//           SizedBox(height: 8.v),
//           Text('$message'),
//           SizedBox(height: 8.v),
//         ],
//       );
//     }

//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.custom,
//       title: title,
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       animType: animType,
//       icon: widget,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: true,
//     );
//   }

//   static error({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = const Color(0XFFFEE8E8),
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = const Color(0XFFFC7474),
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.close_outlined,
//     double? size = 60,
//     Color? color = const Color(0XFFFC7474),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.error,
//       title: title,
//       text: message,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }

//   static info({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = Colors.white,
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.info_outline,
//     double? size = 60,
//     Color? color = const Color(0XFF007C16),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.info,
//       title: title,
//       text: message,
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }

//   static loading({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = Colors.white,
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.downloading_outlined,
//     double? size = 60,
//     Color? color = const Color(0XFF007C16),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.loading,
//       title: title,
//       text: message,
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }

//   static success({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = const Color.fromRGBO(255, 255, 255, 1),
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.check_circle_rounded,
//     double? size = 60,
//     Color? color = const Color(0XFF007C16),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.success,
//       title: title,
//       text: message,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }

//   static warning({
//     String title = '',
//     String message = '',
//     TextAlign? titleAlignment,
//     TextAlign? textAlignment,
//     Widget? widget,
//     QuickAlertAnimType animType = QuickAlertAnimType.scale,
//     bool barrierDismissible = true,
//     void Function()? onConfirmBtnTap,
//     void Function()? onCancelBtnTap,
//     String confirmBtnText = 'Ok',
//     String cancelBtnText = 'Cancel',
//     Color confirmBtnColor = const Color(0XFF007C16),
//     TextStyle? confirmBtnTextStyle,
//     TextStyle? cancelBtnTextStyle,
//     Color backgroundColor = Colors.white,
//     Color headerBackgroundColor = const Color(0XFF007C16),
//     Color titleColor = Colors.black,
//     Color textColor = Colors.black,
//     Color? barrierColor,
//     bool showCancelBtn = false,
//     bool showConfirmBtn = true,
//     double borderRadius = 15.0,
//     String? customAsset,
//     double? width,
//     Duration? autoCloseDuration,
//     bool disableBackBtn = false,
//     IconData? icon = Icons.warning_rounded,
//     double? size = 60,
//     Color? color = const Color(0XFFF79E1B),
//   }) {
//     QuickAlert.show(
//       context: Get.context!,
//       type: QuickAlertType.warning,
//       title: title,
//       text: message,
//       icon: buildIcon(icon: icon, size: size, color: color),
//       titleAlignment: titleAlignment,
//       textAlignment: textAlignment,
//       widget: widget,
//       animType: animType,
//       barrierDismissible: barrierDismissible,
//       onConfirmBtnTap: onConfirmBtnTap,
//       onCancelBtnTap: onCancelBtnTap,
//       confirmBtnText: confirmBtnText,
//       cancelBtnText: cancelBtnText,
//       confirmBtnColor: confirmBtnColor,
//       confirmBtnTextStyle: confirmBtnTextStyle,
//       cancelBtnTextStyle: cancelBtnTextStyle,
//       backgroundColor: backgroundColor,
//       headerBackgroundColor: headerBackgroundColor,
//       titleColor: titleColor,
//       textColor: textColor,
//       barrierColor: barrierColor,
//       showCancelBtn: showCancelBtn,
//       showConfirmBtn: showConfirmBtn,
//       borderRadius: borderRadius,
//       customAsset: customAsset,
//       width: width,
//       autoCloseDuration: autoCloseDuration,
//       disableBackBtn: disableBackBtn,
//     );
//   }
// }
