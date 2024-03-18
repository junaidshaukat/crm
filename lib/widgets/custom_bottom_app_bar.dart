// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:vector_math/vector_math.dart' as vector;

enum BottomBarEnum {
  donors,
  analytics,
  home,
  campaign,
  more
}

const double CIRCLE_SIZE = 40; //50
const double ARC_HEIGHT = 50; //60
const double ARC_WIDTH = 70; //80
const double CIRCLE_OUTLINE = 8.5; //10
const double SHADOW_ALLOWANCE = 17; //20
const double BAR_HEIGHT = 55; //60
const double ICON_OFF = -3; //-3
const double ICON_ON = 0; //0
const double TEXT_OFF = 10; //10
const double TEXT_ON = 1; //1
const double ALPHA_OFF = 0; //0
const double ALPHA_ON = 1; //1
const int ANIM_DURATION = 300; //300

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

  final double iconYAlign = ICON_ON;
  final double textYAlign = TEXT_OFF;
  final double iconAlpha = ALPHA_ON;

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
              duration: const Duration(milliseconds: ANIM_DURATION),
              alignment: Alignment(0, (selected) ? TEXT_ON : TEXT_OFF),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 11.adaptSize,
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
              duration: const Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? ICON_OFF : ICON_ON),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: ANIM_DURATION),
                opacity: (selected) ? ALPHA_OFF : ALPHA_ON,
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

  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect = Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
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

class FancyBottomNavigation extends StatefulWidget {
  const FancyBottomNavigation({
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
  FancyBottomNavigationState createState() => FancyBottomNavigationState();
}

class FancyBottomNavigationState extends State<FancyBottomNavigation> with TickerProviderStateMixin, RouteAware {
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
    circleColor = widget.circleColor ?? ((Theme.of(context).brightness == Brightness.dark) ? Colors.white : Theme.of(context).primaryColor);

    activeIconColor = widget.activeIconColor ?? ((Theme.of(context).brightness == Brightness.dark) ? Colors.black54 : Colors.white);

    barBackgroundColor = widget.barBackgroundColor ?? ((Theme.of(context).brightness == Brightness.dark) ? const Color(0xFF212121) : Colors.white);
    textColor = widget.textColor ?? ((Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black54);
    inactiveIconColor = (widget.inactiveIconColor) ?? ((Theme.of(context).brightness == Brightness.dark) ? Colors.white : Theme.of(context).primaryColor);
  }

  @override
  void initState() {
    super.initState();
    _setSelected(widget.tabs[widget.initialSelection].key);
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
            height: BAR_HEIGHT,
            decoration: BoxDecoration(
              color: barBackgroundColor,
              boxShadow: const [
                BoxShadow(color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
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
                        int selected = widget.tabs.indexWhere((tabData) => tabData.key == uniqueKey);
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
            top: -(CIRCLE_SIZE + CIRCLE_OUTLINE + SHADOW_ALLOWANCE) / 2,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeOut,
              alignment: Alignment(_circleAlignX, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: FractionallySizedBox(
                  widthFactor: 1 / widget.tabs.length,
                  child: GestureDetector(
                    onTap: widget.tabs[currentSelected].onclick as void Function()?,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: CIRCLE_SIZE + CIRCLE_OUTLINE + SHADOW_ALLOWANCE,
                          width: CIRCLE_SIZE + CIRCLE_OUTLINE + SHADOW_ALLOWANCE,
                          child: ClipRect(
                            clipper: HalfClipper(),
                            child: Center(
                              child: Container(
                                width: CIRCLE_SIZE + CIRCLE_OUTLINE,
                                height: CIRCLE_SIZE + CIRCLE_OUTLINE,
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
                          height: ARC_HEIGHT,
                          width: ARC_WIDTH,
                          child: CustomPaint(
                            painter: HalfPainter(barBackgroundColor),
                          ),
                        ),
                        SizedBox(
                          height: CIRCLE_SIZE,
                          width: CIRCLE_SIZE,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: ANIM_DURATION ~/ 5),
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

    Future.delayed(const Duration(milliseconds: ANIM_DURATION ~/ 5), () {
      setState(() {
        activeIcon = nextIcon;
      });
    }).then((_) {
      Future.delayed(const Duration(milliseconds: (ANIM_DURATION ~/ 5 * 3)), () {
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
