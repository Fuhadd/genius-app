import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/auto_how_it_works_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/auto_need_know_bottom_sheet%20copy.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/auto_plan_benefits_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hmo_id_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/pdf_view_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_actions_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_adjustment_bottom_sheet%20copy.dart';
import 'package:genius_app/models/screen_prop_models/auto_plans_model.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class AutoPlansScreen extends StatefulWidget {
  final AutoPlansModel data;
  const AutoPlansScreen({super.key, required this.data});

  @override
  State<AutoPlansScreen> createState() => _AutoPlansScreenState();
}

class _AutoPlansScreenState extends State<AutoPlansScreen> {
  String? localPdfPath;
  bool isLoading = true;
  bool isExpanded = false;
  final Dio dio = Dio();
  double? downloadProgress;

  String pdfUrl =
      // "https://drive.google.com/file/d/1z3lWy0YUT6iqpKerjAkNi8U6j08BeVVR/view?usp=sharing";
      "https://drive.google.com/uc?export=download&id=1z3lWy0YUT6iqpKerjAkNi8U6j08BeVVR";

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/preview.pdf';

      await dio.download(
        pdfUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = received / total;
            });
          }
        },
      );

      setState(() {
        localPdfPath = filePath;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> downloadPdf() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = pdfUrl.split('/').last;
      final savePath = '${dir.path}/$fileName';

      await dio.download(
        pdfUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // You could show download progress here
          }
        },
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('PDF Downloaded to $savePath')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download failed: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      ConstantString.backButtonIcon,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(23.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  boldText(
                    'Comprehensive',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: widget.data.isExpired
                          ? CustomColors.red50Color
                          : CustomColors.green100Color,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                      child: boldText(
                        // isExpired ? 'Expired' :
                        widget.data.isExpired ? 'Expired' : 'Active',
                        fontSize: 10.sp,
                        color: widget.data.isExpired
                            ? CustomColors.red500Color
                            : CustomColors.green500Color,
                      ),
                    ),
                  ),
                  horizontalSpacer(8.w),
                  Container(
                    width: 1.5,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: CustomColors.gray200Color,
                    ),
                  ),
                  horizontalSpacer(8.w),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: CustomColors.grey100Color,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ConstantString.smallSupportIcon,
                          ),
                          horizontalSpacer(4.w),
                          semiBoldText(
                            // isExpired ? 'Expired' :
                            'Support',
                            fontSize: 10.sp,
                            color:
                                //  isExpired
                                //     ? CustomColors.red500Color
                                //     :
                                CustomColors.blackTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpacer(8.w),
                  GestureDetector(
                    onTap: () {
                      showPlanActionsBottomSheet(
                        context,
                        insuranceType: InsuranceType.vehicle,
                      );
                    },
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.grey100Color,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          ConstantString.newMoreIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacer(44.h),
                    widget.data.isExpired
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBgColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 236.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ConstantString.blurredImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      height: 236.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: CustomColors.whiteColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          boldText(
                                            'Plan Expired',
                                            fontSize: 20.sp,
                                            color: CustomColors.red500Color,
                                          ),
                                          verticalSpacer(12.h),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "This plan has expired, and so has your vehicle protection. Renew now to stay covered.\n",
                                                    style: CustomTextStyles
                                                        .regular(
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Note: ",
                                                    style: CustomTextStyles
                                                        .semiBold(
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "Renewing an expired plan requires an inspection",
                                                    style: CustomTextStyles
                                                        .regular(
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          verticalSpacer(12.h),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: 1.sw * 0.8,
                                    decoration: BoxDecoration(
                                        color: CustomColors.greyBgColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 156.h,
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
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4,
                                                  ), // Adjust the radius as needed
                                                  topRight: Radius.circular(
                                                    4,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    isLoading
                                                        ? Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                CircularProgressIndicator(
                                                                  value:
                                                                      downloadProgress,
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(downloadProgress !=
                                                                        null
                                                                    ? 'Loading: ${(downloadProgress! * 100).toStringAsFixed(0)}%'
                                                                    : 'Loading...'),
                                                              ],
                                                            ),
                                                          )
                                                        : localPdfPath != null
                                                            ? GestureDetector(
                                                                // onTap: () {
                                                                //   print(111);
                                                                //   showHmoIdBottomSheet(
                                                                //       context);
                                                                // },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      4,
                                                                    ), // Adjust the radius as needed
                                                                    topRight: Radius
                                                                        .circular(
                                                                      4,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      PDFView(
                                                                    filePath:
                                                                        localPdfPath!,
                                                                    enableSwipe:
                                                                        true,
                                                                    swipeHorizontal:
                                                                        true,
                                                                    autoSpacing:
                                                                        false,
                                                                    pageFling:
                                                                        false,
                                                                  ),
                                                                ),
                                                              )
                                                            : Center(
                                                                child: Text(
                                                                    'Failed to load PDF')),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.h,
                                                                  right: 8.w),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              print(pdfUrl);
                                                              print(
                                                                  localPdfPath);
                                                              showPdfViewBottomSheet(
                                                                context,
                                                                localPdfPath ??
                                                                    '',
                                                                title:
                                                                    'Your Insurance Certificate',
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: CustomColors
                                                                    .blackTextColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(6),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  ConstantString
                                                                      .expandIcon,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: CustomColors.whiteColor,
                                              border: Border(
                                                  top: BorderSide(
                                                color:
                                                    CustomColors.grey100Color,
                                              )),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                  4,
                                                ), // Adjust the radius as needed
                                                bottomRight: Radius.circular(
                                                  4,
                                                ),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: SvgPicture.asset(
                                                    // ConstantString.doctorIcon,
                                                    ConstantString.transCarIcon,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w,
                                                    vertical: 14.h,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      semiBoldText(
                                                        'Tesla Model X',
                                                        fontSize: 14.sp,
                                                        color: CustomColors
                                                            .blackTextColor,
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomColors
                                                              .compMainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.w,
                                                                  vertical:
                                                                      5.h),
                                                          child: semiBoldText(
                                                            'Certificate',
                                                            fontSize: 12.sp,
                                                            color: CustomColors
                                                                .orangeTextColor,
                                                          ),
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
                                  ),
                                  horizontalSpacer(10.w),
                                  Container(
                                    width: 1.sw * 0.8,
                                    decoration: BoxDecoration(
                                        color: CustomColors.greyBgColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print(111);
                                              showHmoIdBottomSheet(context);
                                            },
                                            child: Container(
                                              height: 156.h,
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
                                              child: Stack(
                                                children: [
                                                  isLoading
                                                      ? Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CircularProgressIndicator(
                                                                value:
                                                                    downloadProgress,
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(downloadProgress !=
                                                                      null
                                                                  ? 'Loading: ${(downloadProgress! * 100).toStringAsFixed(0)}%'
                                                                  : 'Loading...'),
                                                            ],
                                                          ),
                                                        )
                                                      : localPdfPath != null
                                                          ? GestureDetector(
                                                              // onTap: () {
                                                              //   print(111);
                                                              //   showHmoIdBottomSheet(
                                                              //       context);
                                                              // },
                                                              child: PDFView(
                                                                filePath:
                                                                    localPdfPath!,
                                                                enableSwipe:
                                                                    true,
                                                                swipeHorizontal:
                                                                    true,
                                                                autoSpacing:
                                                                    false,
                                                                pageFling:
                                                                    false,
                                                              ),
                                                            )
                                                          : Center(
                                                              child: Text(
                                                                  'Failed to load PDF')),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8.h,
                                                                right: 8.w),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            print(pdfUrl);
                                                            print(localPdfPath);
                                                            showPdfViewBottomSheet(
                                                              context,
                                                              localPdfPath ??
                                                                  '',
                                                              title:
                                                                  'Your Policy I.D',
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: CustomColors
                                                                  .blackTextColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6),
                                                              child: SvgPicture
                                                                  .asset(
                                                                ConstantString
                                                                    .expandIcon,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: CustomColors.whiteColor,
                                              border: Border(
                                                  top: BorderSide(
                                                color:
                                                    CustomColors.grey100Color,
                                              )),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                  4,
                                                ), // Adjust the radius as needed
                                                bottomRight: Radius.circular(
                                                  4,
                                                ),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: SvgPicture.asset(
                                                    // ConstantString.doctorIcon,
                                                    ConstantString.transCarIcon,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w,
                                                    vertical: 14.h,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      semiBoldText(
                                                        'Tesla Model X',
                                                        fontSize: 14.sp,
                                                        color: CustomColors
                                                            .blackTextColor,
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomColors
                                                              .compMainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.w,
                                                                  vertical:
                                                                      5.h),
                                                          child: semiBoldText(
                                                            'Policy Document',
                                                            fontSize: 12.sp,
                                                            color: CustomColors
                                                                .orangeTextColor,
                                                          ),
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
                                  ),
                                  horizontalSpacer(20.w),
                                ],
                              ),
                            ),
                          ),

                    verticalSpacer(32.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: widget.data.isExpired
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 32.h),
                              child: CustomButton(
                                title: 'Renew Plan',
                                onTap: () {
                                  showPlanAdjustmentBottomSheet(context,
                                      planAdjustmentType:
                                          PlanAdjustmentType.renew);
                                },
                              ),
                            )
                          : SizedBox.shrink(),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomColors.lightOrangeColor,
                          border: Border.all(
                            color: CustomColors.orange100Color,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 12.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.frontCarIcon,
                                      ),
                                      horizontalSpacer(4.w),
                                      semiBoldText(
                                        'My Vehicle(s)',
                                        fontSize: 16.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.w, vertical: 3.h),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.moneyIcon,
                                          ),
                                          horizontalSpacer(5.w),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "₦",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "50,000/ ",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "month",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              verticalSpacer(12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Purchased By',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        'Chidinma Ukaegbu',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  )),
                                  // Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Plan ID',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      Row(
                                        children: [
                                          semiBoldText(
                                            '8901382091',
                                            fontSize: 12.sp,
                                            color: CustomColors.orange900Color,
                                          ),
                                          horizontalSpacer(4.w),
                                          SvgPicture.asset(
                                            ConstantString.copyIcon,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              verticalSpacer(20.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Date Purchased',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        '25/05/2025',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  )),
                                  // Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Expiry Date',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        '25/05/2025   ',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              verticalSpacer(10.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpacer(32.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: widget.data.isExpired
                          ? SizedBox.shrink()
                          : Padding(
                              padding: EdgeInsets.only(bottom: 32.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.005), // Subtle shadow color
                                      blurRadius: 2, // Softness of the shadow
                                      spreadRadius: 1, // Slight expansion
                                      offset: Offset(0,
                                          1), // Vertical movement of the shadow
                                    ),
                                    // BoxShadow(
                                    //   color: Colors.black
                                    //       .withOpacity(0.05), // Subtle shadow color
                                    //   blurRadius: 4, // Softness of the shadow
                                    //   spreadRadius: 1, // Slight expansion
                                    //   offset: Offset(
                                    //       0, 2), // Vertical movement of the shadow
                                    // ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20.h,
                                    bottom: 24.h,
                                    right: 16.w,
                                    left: 16.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          semiBoldText(
                                            'All Vehicles',
                                            fontSize: 14.sp,
                                            color: CustomColors.greenTextColor,
                                          ),
                                        ],
                                      ),
                                      verticalSpacer(8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 36.h,
                                            width: 36.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  CustomColors.orange100Color,
                                            ),
                                            child: Center(
                                              child: boldText(
                                                'CU',
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.orange900Color,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                RouteConstants
                                                    .manageVehiclesScreen,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  border: Border.all(
                                                    color: CustomColors
                                                        .green400Color,
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                    vertical: 8.h),
                                                child: Row(
                                                  children: [
                                                    semiBoldText(
                                                      'View',
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .green400Color,
                                                    ),
                                                    horizontalSpacer(13.w),
                                                    SvgPicture.asset(
                                                      ConstantString
                                                          .chevronRight,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    // verticalSpacer(32.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.005), // Subtle shadow color
                              blurRadius: 2, // Softness of the shadow
                              spreadRadius: 1, // Slight expansion
                              offset: Offset(
                                  0, 1), // Vertical movement of the shadow
                            ),
                            // BoxShadow(
                            //   color: Colors.black
                            //       .withOpacity(0.05), // Subtle shadow color
                            //   blurRadius: 4, // Softness of the shadow
                            //   spreadRadius: 1, // Slight expansion
                            //   offset: Offset(
                            //       0, 2), // Vertical movement of the shadow
                            // ),
                          ],
                        ),
                        child: Column(
                          children: [
                            OptionsWidget(
                              title: 'Plan benefits',
                              subtitle: 'View your plan\'s full benefits',
                              icon: ConstantString.planBenefitIcon,
                              onTap: () {
                                showAutoPlanBenefitsBottomSheet(context);
                              },
                            ),
                            Divider(
                              color: CustomColors.grey100Color,
                            ),
                            OptionsWidget(
                              title: 'Need to know',
                              subtitle: 'See the things you need to know',
                              icon: ConstantString.needToKnowIcon,
                              onTap: () {
                                showAutoNeedKnowBottomSheet(context);
                              },
                            ),
                            Divider(
                              color: CustomColors.grey100Color,
                            ),
                            OptionsWidget(
                              title: 'How it works',
                              subtitle: 'Get to know how your plan works',
                              icon: ConstantString.howItWorksIcon,
                              onTap: () {
                                showHowItWorksBottomSheet(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(
                        MediaQuery.of(context).padding.bottom + 20.h),
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

class OptionsWidget extends StatelessWidget {
  final String title, subtitle, icon;
  final void Function()? onTap;
  const OptionsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            horizontalSpacer(12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.newGreenTextColor,
                ),
                mediumText(
                  subtitle,
                  fontSize: 12.sp,
                  color: CustomColors.grey800Color,
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset(
              ConstantString.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
