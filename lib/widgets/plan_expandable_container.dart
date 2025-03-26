import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class PlanExpandableContainer extends StatefulWidget {
  final String title, icon, subtitle;
  final Widget child;
  final Widget? subtitleBody;
  final String? secondTitle;
  final Color? titleColor;
  final double? fontSize, expandedHeight, titlePadding;
  final bool? isExpanded;
  final Color iconBgColor;
  final Color? iconColor;
  final bool isSubtitleCurrency, showsubtitle;

  const PlanExpandableContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.iconBgColor,
    required this.icon,
    this.titleColor,
    this.fontSize,
    this.expandedHeight,
    this.isExpanded = false,
    this.isSubtitleCurrency = true,
    this.showsubtitle = true,
    this.iconColor,
    this.titlePadding,
    this.secondTitle,
    this.subtitleBody,
  });

  @override
  State<PlanExpandableContainer> createState() =>
      _PlanExpandableContainerState();
}

class _PlanExpandableContainerState extends State<PlanExpandableContainer> {
  bool _isExpanded = false;
  @override
  void initState() {
    _isExpanded = widget.isExpanded ?? false;
    super.initState();
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleContainer,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15),
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.005),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        // width: 300,
        height: _isExpanded
            ? widget.expandedHeight ?? MediaQuery.of(context).size.height * 0.32
            : 64.h,
        child: ClipRect(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.iconBgColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          widget.icon,
                          color: widget.iconColor,
                        ),
                      ),
                    ),
                    horizontalSpacer(widget.titlePadding ?? 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        semiBoldText(
                          widget.title,
                          fontSize: widget.fontSize ?? 14.sp,
                          color: widget.titleColor ?? CustomColors.grey700Color,
                        ),
                        if (widget.secondTitle != null)
                          mediumText(
                            widget.secondTitle!,
                            fontSize: 12.sp,
                            color: CustomColors.grey500Color,
                          ),
                      ],
                    ),
                    horizontalSpacer(10.w),
                    Expanded(
                      child: widget.subtitleBody ??
                          (!widget.showsubtitle
                              ? SizedBox.shrink()
                              : widget.isSubtitleCurrency
                                  ? RichText(
                                      textAlign: TextAlign.end,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "₦",
                                              style: TextStyle(
                                                fontFamily: '',
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    CustomColors.blackTextColor,
                                                fontSize: 14.sp,
                                              )),
                                          TextSpan(
                                            text: widget.subtitle,
                                            style: CustomTextStyles.bold(
                                              color:
                                                  CustomColors.blackTextColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : boldText(
                                      widget.subtitle,
                                      color: CustomColors.blackTextColor,
                                      fontSize: 14.sp,
                                    )),
                    ),
                    horizontalSpacer(5.w),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: SvgPicture.asset(
                          ConstantString.chevronDown,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child:

                          //     HtmlWidget(
                          //   widget.subTtitle,
                          // ),

                          Scrollbar(
                        // isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                thickness: 0.4,
                                color: CustomColors.gray200Color,
                              ),
                              widget.child,
                            ],
                          ),

                          // Text(
                          //   'Here is the expanded content. You can show more information here. Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.',
                          //   style: TextStyle(color: Colors.black, fontSize: 16),
                          // ),
                        ),
                      ),
                    ),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
                // if (_isExpanded) ...[
                //   const SizedBox(height: 20),
                //   const Text(
                //     'Here is the expanded content. You can show more information here.',
                //     style: TextStyle(color: Colors.white, fontSize: 16),
                //   ),
                // ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
