import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

void showPdfViewBottomSheet(
  BuildContext context,
  String localPdfPath, {
  String? title,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) {
        return LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.9, // max height constraint
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      verticalSpacer(26.h),
                      boldText(
                        title ?? 'Your H.M.O I.D',
                        fontSize: 20.sp,
                        color: CustomColors.green400Color,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpacer(32.h),
                      Container(
                        decoration: BoxDecoration(
                            color: CustomColors.greyBgColor,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      4,
                                    ), // Adjust the radius as needed
                                    topRight: Radius.circular(
                                      4,
                                    ),
                                  ),
                                ),
                                child: PDFView(
                                  filePath: localPdfPath,
                                  enableSwipe: true,
                                  swipeHorizontal: true,
                                  autoSpacing: false,
                                  pageFling: false,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.lightOrangeColor,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: SvgPicture.asset(
                                        // ConstantString.doctorIcon,
                                        ConstantString.hour24Logo,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            // ConstantString.doctorIcon,
                                            ConstantString.smallSupportIcon,
                                            color: CustomColors.orange500Color,
                                          ),
                                          horizontalSpacer(4.w),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Contact ",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Support ",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .orange500Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "for help",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Container(
                              //   decoration: BoxDecoration(
                              //     color: CustomColors.whiteColor,
                              //     borderRadius: BorderRadius.only(
                              //       bottomLeft: Radius.circular(
                              //         4,
                              //       ), // Adjust the radius as needed
                              //       bottomRight: Radius.circular(
                              //         4,
                              //       ),
                              //     ),
                              //   ),
                              //   child: Padding(
                              //     padding: EdgeInsets.symmetric(
                              //         vertical: 12.h, horizontal: 12.w),
                              //     child: Column(
                              //       children: [
                              //         Row(
                              //           children: [
                              //             Row(
                              //               children: [
                              //                 Container(
                              //                   height: 25.h,
                              //                   width: 25.w,
                              //                   decoration: BoxDecoration(
                              //                     shape: BoxShape.circle,
                              //                     color: CustomColors
                              //                         .lightBlueColor,
                              //                   ),
                              //                   child: Center(
                              //                     child: SvgPicture.asset(
                              //                       ConstantString
                              //                           .blueHealthIcon,
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 horizontalSpacer(4.w),
                              //                 semiBoldText(
                              //                   'FlexiCare',
                              //                   fontSize: 20.sp,
                              //                   color:
                              //                       CustomColors.green400Color,
                              //                 ),
                              //               ],
                              //             ),
                              //             Spacer(),
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(40),
                              //                 color: CustomColors.green50Color,
                              //               ),
                              //               child: Padding(
                              //                 padding: EdgeInsets.symmetric(
                              //                     horizontal: 14.w,
                              //                     vertical: 4.h),
                              //                 child: boldText(
                              //                   'Active',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.green500Color,
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         verticalSpacer(20.h),
                              //         Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 regularText(
                              //                   'Name',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //                 verticalSpacer(5.h),
                              //                 semiBoldText(
                              //                   'Chidinma Ukaegbu',
                              //                   fontSize: 14.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 )
                              //               ],
                              //             )),
                              //             // Spacer(),
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.end,
                              //               children: [
                              //                 regularText(
                              //                   'Member I.D',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //                 verticalSpacer(5.h),
                              //                 semiBoldText(
                              //                   '160003/0',
                              //                   fontSize: 14.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //               ],
                              //             )
                              //           ],
                              //         ),
                              //         verticalSpacer(20.h),
                              //         Row(
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 regularText(
                              //                   'Active Date',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //                 verticalSpacer(5.h),
                              //                 semiBoldText(
                              //                   '12th May, 2025',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //               ],
                              //             )),
                              //             // Spacer(),
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.end,
                              //               children: [
                              //                 regularText(
                              //                   'Expiry Date',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //                 verticalSpacer(5.h),
                              //                 semiBoldText(
                              //                   '12th June, 2025',
                              //                   fontSize: 12.sp,
                              //                   color: CustomColors.red500Color,
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //         verticalSpacer(20.h),
                              //         Row(
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 regularText(
                              //                   'In partnership with',
                              //                   fontSize: 12.sp,
                              //                   color:
                              //                       CustomColors.blackTextColor,
                              //                 ),
                              //                 verticalSpacer(5.h),
                              //                 Image.asset(
                              //                   ConstantString.bastionLogo,
                              //                   height: 18.h,
                              //                 ),
                              //               ],
                              //             )),
                              //           ],
                              //         ),
                              //         verticalSpacer(10.h),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // verticalSpacer(16.h),
                              // Center(
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(200),
                              //       color: CustomColors.whiteColor,
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 6.0, horizontal: 12),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: [
                              //           semiBoldText(
                              //             'Download',
                              //             fontSize: 12.sp,
                              //             color: CustomColors.green400Color,
                              //           ),
                              //           horizontalSpacer(10.w),
                              //           SvgPicture.asset(
                              //             ConstantString.greenDownloadIcon,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // // verticalSpacer(16.h),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(
                          MediaQuery.of(context).padding.bottom + 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
