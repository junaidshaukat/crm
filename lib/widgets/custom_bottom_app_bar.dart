import 'dart:math';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

enum BottomBarEnum { donors, analytics, home, campaign, more }

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.uniqueKey,
    required this.selected,
    required this.iconData,
    required this.title,
    required this.callbackFunction,
    required this.textColor,
    required this.iconColor,
  });

  final UniqueKey uniqueKey;
  final String title;
  final String? iconData;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;

  /// ICON OFF
  double get iconOff {
    return getPlaform == PlatformType.ios ? -5 : -5; //-3
  }

  /// ICON On
  double get iconOn {
    return getPlaform == PlatformType.ios ? 0 : 0; //0
  }

  /// OPACITY ON
  double get opacityOn {
    return getPlaform == PlatformType.ios ? 1 : 1; //0
  }

  /// OPACITY OFF
  double get opacityOff {
    return getPlaform == PlatformType.ios ? 0 : 0; //0
  }

  /// TEXT OFF
  double get textOff {
    return getPlaform == PlatformType.ios ? 20 : 20; //10
  }

  /// TEXT ON
  double get textOn {
    return getPlaform == PlatformType.ios ? 0.4 : 0.8; //1
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment(0, (selected) ? textOn : textOff),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? iconOff : iconOn),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: (selected) ? opacityOff : opacityOn,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  alignment: const Alignment(0, 0),
                  icon: CustomImageView(
                    height: 24.v,
                    width: 24.h,
                    imagePath: iconData,
                    svgColor: iconColor,
                  ),
                  onPressed: () {
                    callbackFunction(uniqueKey);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HalfPainter extends CustomPainter {
  HalfPainter(Color paintColor) {
    arcPaint = Paint()..color = paintColor;
  }

  late Paint arcPaint;

  double radians(double degrees) => degrees * degrees2Radians;
  double degrees2Radians = pi / 180.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, radians(0), radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, radians(0), -radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, radians(180), radians(-90), false);
    path.close();

    canvas.drawPath(path, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.tabs,
    required this.onTabChangedListener,
    this.initialSelection = 0,
    this.circleColor,
    this.activeIconColor,
    this.inactiveIconColor,
    this.textColor,
    this.barBackgroundColor,
  }) : assert(tabs.length > 1 && tabs.length < 6);

  final Function(int position) onTabChangedListener;
  final Color? circleColor;
  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? textColor;
  final Color? barBackgroundColor;
  final List<TabData> tabs;
  final int initialSelection;

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  String? nextIcon;
  String? activeIcon;
  int currentSelected = 0;
  double _circleAlignX = 0;
  double _circleIconAlpha = 1;

  late Color circleColor;
  late Color activeIconColor;
  late Color inactiveIconColor;
  late Color barBackgroundColor;
  late Color textColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    activeIcon = widget.tabs[currentSelected].icon;
    circleColor = widget.circleColor ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor);

    activeIconColor = widget.activeIconColor ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.black54
            : Colors.white);

    barBackgroundColor = widget.barBackgroundColor ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? const Color(0xFF212121)
            : Colors.white);
    textColor = widget.textColor ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Colors.black54);
    inactiveIconColor = (widget.inactiveIconColor) ??
        ((Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor);
  }

  @override
  void initState() {
    super.initState();
    _setSelected(widget.tabs[widget.initialSelection].key);
  }

  /// CIRCLE SIZE
  double get circleSize {
    return getPlaform == PlatformType.ios ? 40 : 45; //50;
  }

  /// ARC HEIGHT
  double get arcHeight {
    return getPlaform == PlatformType.ios ? 55 : 60; //60
  }

  /// ARC WIDTH
  double get arcWidth {
    return getPlaform == PlatformType.ios ? 75 : 80; //80
  }

  /// CIRCLE OUTLINE
  double get circleOutline {
    return getPlaform == PlatformType.ios ? 12 : 10; //10
  }

  /// SHADOW ALLOWANCE
  double get shadowAllowance {
    return getPlaform == PlatformType.ios ? 22 : 20; //20
  }

  /// BAR HEIGHT
  double get height {
    return getPlaform == PlatformType.ios ? 65 : 60; //60
  }

  _setSelected(UniqueKey key) {
    int selected = widget.tabs.indexWhere((tabData) => tabData.key == key);

    if (mounted) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.whiteA700,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: height,
            decoration: BoxDecoration(
              color: barBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 8,
                )
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.tabs
                  .map(
                    (t) => TabItem(
                      uniqueKey: t.key,
                      selected: t.key == widget.tabs[currentSelected].key,
                      iconData: t.icon,
                      title: t.title,
                      iconColor: inactiveIconColor,
                      textColor: textColor,
                      callbackFunction: (uniqueKey) {
                        int selected = widget.tabs
                            .indexWhere((tabData) => tabData.key == uniqueKey);
                        widget.onTabChangedListener(selected);
                        _setSelected(uniqueKey);
                        _initAnimationAndStart(_circleAlignX, 1);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Positioned.fill(
            top: -(circleSize + circleOutline + shadowAllowance) / 2,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              alignment: Alignment(_circleAlignX, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: FractionallySizedBox(
                  widthFactor: 1 / widget.tabs.length,
                  child: GestureDetector(
                    onTap: widget.tabs[currentSelected].onclick as void
                        Function()?,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: circleSize + circleOutline + shadowAllowance,
                          width: circleSize + circleOutline + shadowAllowance,
                          child: ClipRect(
                            clipper: HalfClipper(),
                            child: Center(
                              child: Container(
                                width: circleSize + circleOutline,
                                height: circleSize + circleOutline,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: arcHeight,
                          width: arcWidth,
                          child: CustomPaint(
                            painter: HalfPainter(barBackgroundColor),
                          ),
                        ),
                        SizedBox(
                          height: circleSize,
                          width: circleSize,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: AnimatedOpacity(
                                duration:
                                    const Duration(milliseconds: 300 ~/ 5),
                                opacity: _circleIconAlpha,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CustomImageView(
                                    imagePath: activeIcon,
                                    svgColor: activeIconColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _initAnimationAndStart(double from, double to) {
    _circleIconAlpha = 0;

    Future.delayed(const Duration(milliseconds: 300 ~/ 5), () {
      setState(() {
        activeIcon = nextIcon;
      });
    }).then((_) {
      Future.delayed(const Duration(milliseconds: (300 ~/ 5 * 3)), () {
        setState(() {
          _circleIconAlpha = 1;
        });
      });
    });
  }

  void setPage(int page) {
    widget.onTabChangedListener(page);
    _setSelected(widget.tabs[page].key);
    _initAnimationAndStart(_circleAlignX, 1);

    setState(() {
      currentSelected = page;
    });
  }
}

class TabData {
  TabData({
    required this.title,
    required this.icon,
    this.onclick,
  });

  final String title;
  final String? icon;
  final Function? onclick;
  final UniqueKey key = UniqueKey();
}
