import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';

class AnimatedFlipCard extends StatelessWidget {
  final String title;
  final Color? textColor;
  final bool isSelected;
  final void Function()? onTap;
  final Widget frontChild, backChild;
  final double? size;
  const AnimatedFlipCard(
      {super.key,
      this.onTap,
      required this.title,
      // required this.icon,
      required this.isSelected,
      required this.backChild,
      required this.frontChild,
      this.textColor,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: size != null ? size!.h : 156.h,
          width: size != null ? size!.w : 156.w,
          decoration: isSelected
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: CustomColors.green200Color,
                    width: 1.32,
                  ),
                  color: CustomColors.green50Color,
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? CustomColors.green50Color
                      : CustomColors.formBgColor,
                  border: isSelected
                      ? Border.all(color: CustomColors.green500Color, width: 1)
                      : Border.all(color: CustomColors.grey100Color, width: 1),
                ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: isSelected
                  ? Stack(
                      children: [
                        Positioned(
                          right: 15,
                          top: 10,
                          child: Icon(
                            Icons.check_circle,
                            size: 22,
                            color: CustomColors.green500Color,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: backChild,
                          ),
                        ),
                      ],
                    )
                  : frontChild,
            ),
          ),
        ),
      ),
    );
  }
}
