import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_actions_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hmo_id_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/pdf_view_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_history_option_bottom_sheet.dart';
import 'package:genius_app/screens/plans/health_plans/plan_history_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/plan_expandable_container.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({
    super.key,
  });

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormBuilderState>();
  VehicleDetailsTab selectedTab = VehicleDetailsTab.vehicle;
  String? phoneNumber;
  late TabController _tabController;
  String? localPdfPath;
  bool isLoading = true;
  bool isExpanded = false;
  final Dio dio = Dio();
  double? downloadProgress;

  String pdfUrl =
      // "https://drive.google.com/file/d/1z3lWy0YUT6iqpKerjAkNi8U6j08BeVVR/view?usp=sharing";
      "https://drive.google.com/uc?export=download&id=1z3lWy0YUT6iqpKerjAkNi8U6j08BeVVR";

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
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    loadPdf();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: FormBuilder(
          key: formKey,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          semiBoldText(
                            'Vehicle Details',
                            fontSize: 20.sp,
                            color: CustomColors.primaryGreenColor,
                          ),
                          verticalSpacer(8.h),
                          mediumText(
                            'Manage this vehicle',
                            fontSize: 14.sp,
                            color: CustomColors.primaryGreenColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: CustomColors.green100Color,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 6.h),
                        child: boldText(
                          // isExpired ? 'Expired' :
                          'Active',
                          fontSize: 12.sp,
                          color:
                              //  isExpired
                              //     ? CustomColors.red500Color
                              //     :
                              CustomColors.green500Color,
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
                    GestureDetector(
                      onTap: () {
                        showDependantActionsBottomSheet(
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
              verticalSpacer(37.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 45.h,
                  constraints:
                      const BoxConstraints(maxWidth: 400, minHeight: 48),
                  decoration: BoxDecoration(
                    color: CustomColors.formBgColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      // You can adjust the indicator color as needed.
                      color: Colors.white,
                    ),
                    labelPadding: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    onTap: (int mode) {
                      print(mode);
                      setState(() {
                        selectedTab = mode == 0
                            ? VehicleDetailsTab.vehicle
                            : mode == 1
                                ? VehicleDetailsTab.owner
                                : mode == 2
                                    ? VehicleDetailsTab.claims
                                    : VehicleDetailsTab.inspection;
                        // phoneNumber = null;
                      });
                    },
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            semiBoldText(
                              'Vehicle',
                              fontSize: 14.sp,
                              color: selectedTab == VehicleDetailsTab.vehicle
                                  ? CustomColors.blackTextColor
                                  : CustomColors.grey500Color,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            semiBoldText(
                              'Owner',
                              fontSize: 14.sp,
                              color: selectedTab == VehicleDetailsTab.owner
                                  ? CustomColors.blackTextColor
                                  : CustomColors.grey500Color,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            semiBoldText(
                              'Claims',
                              fontSize: 14.sp,
                              color: selectedTab == VehicleDetailsTab.claims
                                  ? CustomColors.blackTextColor
                                  : CustomColors.grey500Color,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            semiBoldText(
                              'Inspection',
                              fontSize: 14.sp,
                              color: selectedTab == VehicleDetailsTab.inspection
                                  ? CustomColors.blackTextColor
                                  : CustomColors.grey500Color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: CustomColors.lightOrangeColor,
                    border: Border.all(
                      color: CustomColors.orange100Color,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: SvgPicture.asset(
                            ConstantString.orangeRoundPattern,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  ConstantString.autoIcon,
                                  height: 32,
                                ),
                                verticalSpacer(8.h),
                                semiBoldText(
                                  'Tesla - Model X',
                                  fontSize: 20.sp,
                                  color: CustomColors.greenText100Color,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacer(20.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for the SMS tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 12.h,
                                      ),
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 12.h,
                                      ),
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
                          verticalSpacer(20.h),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBgColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 180.h,
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
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.grey25Color,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                                0.005), // Subtle shadow color
                                            blurRadius:
                                                2, // Softness of the shadow
                                            spreadRadius: 1, // Slight expansion
                                            offset: Offset(0,
                                                1), // Vertical movement of the shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                        ),
                                        child: Column(
                                          children: [
                                            verticalSpacer(14.sp),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  ConstantString.autoIcon,
                                                  height: 30,
                                                ),
                                              ],
                                            ),
                                            verticalSpacer(4.sp),
                                            DependantDetailsContainer(
                                              title: 'Chassis Number',
                                              subtitle: 'GHJ80809232',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Engine Number',
                                              subtitle: 'GHJ80809232',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Plate Number',
                                              subtitle: 'GHJ80809232',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Vehicle Colour',
                                              subtitle: 'Silver',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Year of Manufacture',
                                              subtitle: '2025',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Email Address',
                                              subtitle: 'clarisse@gmail.com',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Gender',
                                              subtitle: 'Female',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Date of birth',
                                              subtitle: 'clarisse@gmail.com',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Address',
                                              subtitle: 'Safewell Estate Lekki',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Identification type',
                                              subtitle: 'NIN',
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Vehicle license',
                                              subtitle: 'Female',
                                              subtitleBody: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                    ConstantString.pdfEyeIcon,
                                                    height: 24,
                                                  ),
                                                  horizontalSpacer(6.w),
                                                  semiBoldText(
                                                    'Img_jpg1234',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .orange900Color,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DependantDetailsContainer(
                                              title: 'Proof of ownership',
                                              subtitle: 'Female',
                                              subtitleBody: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                    ConstantString.pdfEyeIcon,
                                                    height: 24,
                                                  ),
                                                  horizontalSpacer(6.w),
                                                  semiBoldText(
                                                    'Img_jpg1234',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .orange900Color,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DependantDetailsContainer(
                                              title: 'NIN',
                                              subtitle: 'Female',
                                              subtitleBody: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                    ConstantString.pdfEyeIcon,
                                                    height: 24,
                                                  ),
                                                  horizontalSpacer(6.w),
                                                  semiBoldText(
                                                    'Img_jpg1234',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .orange900Color,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            verticalSpacer(30),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // verticalSpacer(16.h),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 30),
                        ],
                      ),
                    ),
                    // Content for the WhatsApp tab.

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.whiteColor,
                                  border: Border.all(
                                    color: CustomColors.grey100Color,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                ),
                                child: Column(
                                  children: [
                                    verticalSpacer(14.sp),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          ConstantString.roundProfileIcon,
                                          height: 30,
                                          color: CustomColors.orange500Color,
                                        ),
                                      ],
                                    ),
                                    verticalSpacer(4.sp),
                                    DependantDetailsContainer(
                                      title: 'Name',
                                      subtitle: 'Clarisse Ukaegbu',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'Gender',
                                      subtitle: 'Female',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'Date of birth',
                                      subtitle: '12th May, 2025',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'Identification type',
                                      subtitle: 'National ID',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'State of residence',
                                      subtitle: 'Lagos',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'L.G.A of residence',
                                      subtitle: 'Eti-Osa',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'House Address',
                                      subtitle: 'Safewell Estate Lekki',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'Identification Type',
                                      subtitle: 'NIN',
                                    ),
                                    DependantDetailsContainer(
                                      title: 'NIN',
                                      subtitle: 'Sister',
                                      subtitleBody: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.pdfEyeIcon,
                                            height: 24,
                                          ),
                                          horizontalSpacer(6.w),
                                          semiBoldText(
                                            'Img_jpg1234',
                                            fontSize: 14.sp,
                                            color: CustomColors.orange900Color,
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpacer(30),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpacer(
                                MediaQuery.of(context).padding.bottom + 30),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                PlanExpandableContainer(
                                  title: "Stolen Vehicle",
                                  secondTitle: 'Claim Lodged: 12/05/2023',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: CustomColors.green100Color,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6.h,
                                            horizontal: 14.w,
                                          ),
                                          child: semiBoldText(
                                            'Paid',
                                            fontSize: 12.sp,
                                            color: CustomColors.green500Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // titleBody: ,

                                  showsubtitle: false,
                                  subtitle: '',

                                  isExpanded: false,
                                  expandedHeight: 280.h,
                                  titlePadding: 8.w,
                                  iconBgColor: CustomColors.lightOrangeColor,
                                  icon: ConstantString.frontCarIcon,
                                  child: Column(
                                    children: [
                                      verticalSpacer(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Claim ID',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'CSSH2373KL',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Type',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  'Accidental Damage',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Location',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                '22 Ola Road, Lekki ',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Date',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  '13/04/2023',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Details',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'Yo! my story is too long abeg, A drunk man hit my phone and ran on the street😭',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                      verticalSpacer(10.h),
                                    ],
                                  ),
                                ),
                                verticalSpacer(20.h),
                                PlanExpandableContainer(
                                  title: "Loss of Personal Effect",
                                  secondTitle: 'Claim Lodged: 12/05/2023',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: CustomColors.lightOrangeColor,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6.h,
                                            horizontal: 14.w,
                                          ),
                                          child: semiBoldText(
                                            'Pending',
                                            fontSize: 12.sp,
                                            color: CustomColors.orange500Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // titleBody: ,

                                  showsubtitle: false,
                                  subtitle: '',

                                  isExpanded: false,
                                  expandedHeight: 280.h,
                                  titlePadding: 8.w,
                                  iconBgColor: CustomColors.lightBlueColor,
                                  icon: ConstantString.trendDownIcon,
                                  child: Column(
                                    children: [
                                      verticalSpacer(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Claim ID',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'CSSH2373KL',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Type',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  'Accidental Damage',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Location',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                '22 Ola Road, Lekki ',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Date',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  '13/04/2023',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Details',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'Yo! my story is too long abeg, A drunk man hit my phone and ran on the street😭',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                      verticalSpacer(10.h),
                                    ],
                                  ),
                                ),
                                verticalSpacer(20.h),
                                PlanExpandableContainer(
                                  title: "Accidental Damage",
                                  secondTitle: 'Claim Lodged: 12/05/2023',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: CustomColors.red50Color,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6.h,
                                            horizontal: 14.w,
                                          ),
                                          child: semiBoldText(
                                            'Declined',
                                            fontSize: 12.sp,
                                            color: CustomColors.red500Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // titleBody: ,

                                  showsubtitle: false,
                                  subtitle: '',

                                  isExpanded: false,
                                  expandedHeight: 280.h,
                                  titlePadding: 8.w,
                                  iconBgColor: CustomColors.purple50Color,
                                  icon: ConstantString.damageIcon,
                                  child: Column(
                                    children: [
                                      verticalSpacer(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Claim ID',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'CSSH2373KL',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Type',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  'Accidental Damage',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Location',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                '22 Ola Road, Lekki ',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                          // Spacer(),
                                          SizedBox(
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                regularText(
                                                  'Incident Date',
                                                  fontSize: 10.sp,
                                                  color: CustomColors
                                                      .greenText100Color,
                                                ),
                                                verticalSpacer(5.h),
                                                semiBoldText(
                                                  '13/04/2023',
                                                  fontSize: 12.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      verticalSpacer(20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              regularText(
                                                'Loss Details',
                                                fontSize: 10.sp,
                                                color: CustomColors
                                                    .greenText100Color,
                                              ),
                                              verticalSpacer(5.h),
                                              semiBoldText(
                                                'Yo! my story is too long abeg, A drunk man hit my phone and ran on the street😭',
                                                fontSize: 12.sp,
                                                color:
                                                    CustomColors.blackTextColor,
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                      verticalSpacer(10.h),
                                    ],
                                  ),
                                ),
                                verticalSpacer(20.h),
                                verticalSpacer(
                                    MediaQuery.of(context).padding.bottom + 30),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            left: 0,
                            right: 0,
                            child: CustomButton(
                              title: 'Make claim',
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.whiteColor,
                                  border: Border.all(
                                    color: CustomColors.grey50Color,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.005), // Subtle shadow color
                                      blurRadius: 2, // Softness of the shadow
                                      spreadRadius: 1, // Slight expansion
                                      offset: Offset(0,
                                          1), // Vertical movement of the shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacer(14.h),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.lightOrangeColor,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.h,
                                          horizontal: 8.w,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              ConstantString.searchInfoIcon,
                                              // height: 30,
                                              // color:
                                              //     CustomColors.orange500Color,
                                            ),
                                            horizontalSpacer(4.w),
                                            semiBoldText(
                                              'Vehicle inspected by',
                                              fontSize: 10.sp,
                                              color:
                                                  CustomColors.orange500Color,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    verticalSpacer(20.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: semiBoldText(
                                            'Alexander Igwe',
                                            fontSize: 14.sp,
                                            color: CustomColors.blackTextColor,
                                          ),
                                        ),
                                        semiBoldText(
                                          '12/05/2023',
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ],
                                    ),
                                    verticalSpacer(14.h),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpacer(20.h),
                            Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.whiteColor,
                                  border: Border.all(
                                    color: CustomColors.grey100Color,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacer(14.sp),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.lightOrangeColor,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.h,
                                          horizontal: 8.w,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              ConstantString.smallGalleryIcon,
                                              // height: 30,
                                              // color:
                                              //     CustomColors.orange500Color,
                                            ),
                                            horizontalSpacer(4.w),
                                            semiBoldText(
                                              'Inspected Images',
                                              fontSize: 10.sp,
                                              color:
                                                  CustomColors.orange500Color,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    verticalSpacer(24.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carLeftSide,
                                            title: 'Left side view',
                                          ),
                                        ),
                                        horizontalSpacer(15.w),
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carRightSide,
                                            title: 'Right side view',
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpacer(14.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carFrontSide,
                                            title: 'Front view',
                                          ),
                                        ),
                                        horizontalSpacer(15.w),
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carBackSide,
                                            title: 'Back view',
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpacer(14.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carOthersSide,
                                            title: 'Others',
                                          ),
                                        ),
                                        horizontalSpacer(15.w),
                                        Expanded(
                                          child: ImagesContainer(
                                            imageUrl:
                                                ConstantString.carChasisNumber,
                                            title: 'Chassis number',
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpacer(30),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpacer(
                                MediaQuery.of(context).padding.bottom + 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesContainer extends StatelessWidget {
  final String title, imageUrl;
  const ImagesContainer({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          decoration: BoxDecoration(
              color: CustomColors.grey75Color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.r),
                topRight: Radius.circular(4.r),
              )),
          child: Center(
            child: Image.asset(
              imageUrl,
              height: 70,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColors.lightOrangeColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4.r),
              bottomRight: Radius.circular(4.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.h),
            child: Center(
              child: semiBoldText(
                title,
                fontSize: 10.sp,
                color: CustomColors.orange500Color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DependantDetailsContainer extends StatelessWidget {
  final String title, subtitle;
  final Widget? subtitleBody;
  const DependantDetailsContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleBody,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.orange500Color,
                ),
              ),
              horizontalSpacer(12.w),
              mediumText(
                title,
                fontSize: 14.sp,
                color: CustomColors.grey600Color,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: subtitleBody ??
                      semiBoldText(
                        subtitle,
                        fontSize: 14.sp,
                        color: CustomColors.orange900Color,
                      ),
                ),
              ),
            ],
          ),
          verticalSpacer(20.h),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 7.0,
            dashColor: CustomColors.gray200Color,
            dashRadius: 0.0,
            dashGapLength: 8.0,
            // dashGapColor: CustomColors.grey100Color,
            dashGapRadius: 0.0,
          ),
        ],
      ),
    );
  }
}

class ManagePolicyWidget extends StatelessWidget {
  final String title, subtitle, icon;
  final PolicyUser policyUser;
  const ManagePolicyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.policyUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005), // Subtle shadow color
            blurRadius: 2, // Softness of the shadow
            spreadRadius: 1, // Slight expansion
            offset: Offset(0, 1), // Vertical movement of the shadow
          ),
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.004), // Subtle shadow color
          //   blurRadius: 2, // Softness of the shadow
          //   spreadRadius: 1, // Slight expansion
          //   offset: Offset(0, 1), // Vertical movement of the shadow
          // ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.green50Color,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: CustomColors.green500Color,
                ),
              ),
            ),
            horizontalSpacer(12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.blackTextColor,
                ),
                mediumText(
                  subtitle,
                  fontSize: 12.sp,
                  color: CustomColors.grey700Color,
                )
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: CustomColors.brown50Color,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: semiBoldText(
                  policyUser == PolicyUser.owner
                      ? 'Owner'
                      : policyUser == PolicyUser.owner
                          ? 'Major'
                          : 'Minor',
                  fontSize: 10.sp,
                  color: CustomColors.brown500Color,
                ),
              ),
            ),
            horizontalSpacer(10.w),
            SvgPicture.asset(
              ConstantString.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
