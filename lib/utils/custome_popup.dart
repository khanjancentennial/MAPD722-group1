import 'package:flutter/material.dart';

import 'app_color.dart';

class CommonAppBar extends PreferredSize {
  final String title;
  final String? subTitle;
  final double? height;
  final Color? backgroundColor;
  final Color? backArrowColor;
  final bool isBackDisplay;
  final VoidCallback? backClickListener;
  final List<Widget>? actions;
  final Widget? leading;

  CommonAppBar(
      {this.title = "",
        this.subTitle = "",
        this.backgroundColor,
        this.backArrowColor,
        this.isBackDisplay = true,
        this.backClickListener,
        this.actions,
        this.height = kToolbarHeight,
        this.leading}) : super(child: Text(""),preferredSize:  Size.fromHeight(height!));

  // @override
  // Size get preferredSize =>;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: backgroundColor ?? AppColors.buttonColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (backClickListener != null) backClickListener!();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: isBackDisplay
                    ? Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  // child: Image.asset(
                  //   AppImage.backArrowBlack,
                  //   color: backArrowColor ?? AppColors.black,
                  //   height: 22,
                  //   width: 22,
                  // ),
                )
                    : Container(),
              ),
              Container(
                child: leading,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 8.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 5,
                            bottom: 5,
                            top: 5,
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions != null
                  ? Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                  children: actions!,
                    ),
                  )
                  : Container(),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(title, style: TextStyle(color: backArrowColor ?? AppColors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                SizedBox(height: 10.0
                ),
                subTitle != null
                    ? Flexible(
                    child: Text(subTitle!,
                        style: TextStyle(color: backArrowColor ?? AppColors.black, fontSize: 17, fontWeight: FontWeight.w500)))
                    : SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
