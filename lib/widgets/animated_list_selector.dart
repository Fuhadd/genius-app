import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class ListOptionsContainer extends StatelessWidget {
  final String title, subTitle, icon, selectedIcon;
  final Widget? titleWidget, subTitleWidget;
  final String? content;
  final Color? textColor, selectedIconColor, unSelectedIconColor;
  final bool isSelected;
  final double? verticalPadding;
  final void Function()? onTap;
  const ListOptionsContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    this.textColor,
    this.content,
    this.selectedIconColor,
    this.unSelectedIconColor,
    this.verticalPadding,
    this.subTitleWidget,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // height: 85,
        decoration: BoxDecoration(
          // color: CustomColors.gray200Color,
          borderRadius: BorderRadius.circular(10.r),
          border: isSelected
              ? Border.all(color: CustomColors.green500Color, width: 1)
              : Border.all(color: CustomColors.grey100Color, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.w, vertical: verticalPadding ?? 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IconContainer(
              //   diameter: 41.sp,
              //   icon: icon,
              // ),
              // Container(
              //   height: 41.sp,
              //   width: 41.sp,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4.r),
              //     color: CustomColors.lightGreenColor,
              //   ),
              //   child: Center(
              //     child: SvgPicture.asset(icon,
              //         package: 'mca_official_flutter_sdk'),
              //   ),
              // ),
              SvgPicture.asset(
                isSelected ? selectedIcon : icon,
                color: isSelected ? selectedIconColor : unSelectedIconColor,
              ),

              horizontalSpacer(12),
              Expanded(
                child: content == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleWidget ??
                              semiBoldText(
                                title,
                                fontSize: 16.sp,
                                color: textColor ??
                                    (isSelected
                                        ? CustomColors.green500Color
                                        : CustomColors.green400Color),
                              ),
                          verticalSpacer(3.h),
                          subTitleWidget ??
                              mediumText(
                                subTitle,
                                fontSize: 12.sp,
                                color: CustomColors.blackTextColor,
                                // maxLines: 1,
                              )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: mediumText(
                          content ?? '',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                          // maxLines: 1,
                        ),
                      ),
              ),
              isSelected
                  ? Center(
                      child: Icon(
                        Icons.radio_button_checked,
                        color: CustomColors.green500Color,
                        size: 18.sp,
                      ),
                    )
                  : Center(
                      child: Icon(
                        Icons.radio_button_unchecked,
                        color: CustomColors.grey400Color,
                        size: 18.sp,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
