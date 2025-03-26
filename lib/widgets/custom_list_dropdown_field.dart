import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomListDropdownField extends StatefulHookConsumerWidget {
  final String fieldName, label, description;
  final Widget? labelWidget;
  final List<String> items;

  final AutoDisposeStateProvider<String?> selectedItem;
  // final String? selectedItem;
  const CustomListDropdownField({
    super.key,
    required this.fieldName,
    required this.label,
    required this.description,
    required this.items,
    required this.selectedItem,
    this.labelWidget,
  });

  @override
  ConsumerState<CustomListDropdownField> createState() =>
      _CustomListDropdownFieldState();
}

class _CustomListDropdownFieldState
    extends ConsumerState<CustomListDropdownField> {
  Timer? debounce;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode myNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.labelWidget ??
                mediumText(
                  widget.label,
                  fontSize: 16.sp,
                  color: CustomColors.greenTextColor,
                ),
          ],
        ),
        verticalSpacer(12.sp),
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            color: CustomColors.formBgColor,
            border: Border.all(
              color: CustomColors.grey100Color,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: DropdownButtonHideUnderline(
              child: Listener(
                onPointerDown: (_) => FocusScope.of(context).requestFocus(
                  FocusNode(),
                ),
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Text(
                    widget.description,
                    style: CustomTextStyles.medium(
                        fontSize: 16.sp, color: CustomColors.grey600Color),
                    maxLines: 1,
                  ),
                  selectedItemBuilder:
                      // ref.watch(urlFormDataProvider)[widget.fieldName] == null
                      //     ? null
                      //     :
                      (BuildContext context) {
                    return widget.items.map<Widget>((room) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            room,
                            style: CustomTextStyles.semiBold(
                                fontSize: 16.sp,
                                color: CustomColors.greenTextColor),
                            maxLines: 1,
                          ),
                        ],
                      );
                    }).toList();
                  },
                  items: widget.items.map<DropdownMenuItem<Object>>((item) {
                    return DropdownMenuItem<Object>(
                      value: item,
                      child: Text(
                        item,
                        style: CustomTextStyles.medium(
                          fontSize: 16.sp,
                          color: CustomColors.grey600Color,
                        ),
                        maxLines: 1,
                      ),
                    );
                  }).toList(),
                  value: ref.watch(widget.selectedItem),
                  onChanged: (value) async {
                    setState(() {
                      ref.read(widget.selectedItem.notifier).state =
                          value.toString();
                    });
                  },
                  iconStyleData: IconStyleData(
                    icon: SvgPicture.asset(
                      ConstantString.chevronDown,
                      colorFilter: const ColorFilter.mode(
                        CustomColors.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                  ),
                  focusNode: myNode,
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                    elevation: 0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.blackColor.withOpacity(0.15),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: CustomColors.whiteColor,
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: widget.items.length < 10
                      ? null
                      : DropdownSearchData(
                          searchController: textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: textEditingController,
                              cursorColor:
                                  CustomColors.blackColor.withOpacity(0.5),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: widget.description,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.grey100Color,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.green500Color,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: CustomColors.green500Color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value
                                .toString()
                                .toLowerCase()
                                .contains(searchValue.toLowerCase());
                          },
                        ),
                  onMenuStateChange: (isOpen) async {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        verticalSpacer(24.h),
      ],
    );
  }
}
