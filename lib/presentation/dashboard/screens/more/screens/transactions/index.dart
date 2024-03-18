import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});
  final controller = Get.put(TransactionsController());
  final Rx<String?> currency = Rx(null);
  Widget visibility({
    required bool visible,
    required String label,
    required String control,
    TextEditingController? controller,
    String? hintText,
    void Function(String)? onChanged,
    void Function(dynamic)? onSelect,
    required void Function()? onRemove,
    void Function()? onTap,
    dynamic value,
    dynamic checkboxList,
    required TransactionsController conn,
  }) {
    List list = [];
    console.log({
      'checkboxList': checkboxList,
      'value': value,
      'control': control,
      'visible': visible,
    });

    Rx<bool?> switchs = Rx(hintText == '1' ? true : false);
    Rx<String?> datetime = Rx(null);

    if (checkboxList != null) list = checkboxList as List;

    return Visibility(
      visible: visible,
      child: SizedBox(
        width: FIGMA_DESIGN_WIDTH.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (control == 'textbox' ||
                control == "datetime" ||
                control == "switch")
              Text(
                label,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (control == 'checkboxList')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 15.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      conn.query.remove(value);
                      onRemove!();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            if (control == 'datetime')
              Obx(() {
                return Input(
                  readOnly: true,
                  controller: controller,
                  hintText: datetime.value ?? hintText,
                  onChanged: onChanged,
                  onTap: () async {
                    DateTime? date = await Pickers.date(Get.context!);
                    TimeOfDay? time = await Pickers.time(Get.context!);
                    if (date != null && time == null) {
                      datetime.value = '${date.format('yyyy-MM-dd')} 00:00:00';
                      onChanged!(datetime.value!);
                    }
                    if (date != null && time != null) {
                      datetime.value =
                          '${date.format('yyyy-MM-dd')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                      onChanged!(datetime.value!);
                    }
                  },
                  suffixIcon: IconButton(
                    onPressed: onRemove,
                    icon: Icon(
                      Icons.close,
                      color: appTheme.gray400,
                    ),
                  ),
                );
              }),
            if (control == 'checkboxList')
              Wrap(
                children: list.map(
                  (e) {
                    RxBool check = false.obs;
                    if (conn.query.containsKey(value)) {
                      List temp = conn.query[value] as List;
                      if (temp.contains(e['value'])) {
                        check.value = true;
                      }
                    }
                    return GestureDetector(
                      onTap: () {
                        check.value = check.toggle().value;
                        onSelect!({
                          'key': value,
                          'label': e['label'],
                          'value': e['value'],
                          'checked': check.value
                        });
                      },
                      child: SizedBox(
                        width: 170.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () {
                                return Checkbox(
                                  value: check.value,
                                  side: BorderSide(
                                    color: appTheme.primary,
                                    width: 1.8,
                                  ),
                                  onChanged: (checked) {
                                    check.value = checked!;
                                    onSelect!({
                                      'key': value,
                                      'label': e['label'],
                                      'value': e['value'],
                                      'checked': checked
                                    });
                                  },
                                );
                              },
                            ),
                            Expanded(child: Text(e['label']))
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            if (control == 'textbox')
              Input(
                controller: controller,
                hintText: hintText,
                onChanged: onChanged,
                borderColor: appTheme.gray400,
                suffixIcon: IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.close,
                    color: appTheme.gray400,
                  ),
                ),
              ),
            if (control == 'switch')
              Obx(() {
                onChanged!(switchs.value == true ? '1' : '0');
                return CustomSwitch(
                  value: switchs.value,
                  alignment: Alignment.bottomLeft,
                  onChange: (option) {
                    switchs(option);
                  },
                );
              }),
            SizedBox(height: 4.v)
          ],
        ),
      ),
    );
  }

  void onTapFilter() {
    Get.bottomSheet(
      persistent: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.adaptSize),
          topRight: Radius.circular(20.adaptSize),
        ),
      ),
      Container(
        width: double.maxFinite,
        height: (FIGMA_DESIGN_HEIGHT * 0.9).adaptSize,
        margin: EdgeInsets.only(bottom: 0.v),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
        decoration: AppDecoration.outlineBluegray100011,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgColor: Colors.black,
                    imagePath: "back".icon.svg,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const Spacer(flex: 1),
                  Text(
                    "filter_transaction".tr,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              SizedBox(height: 11.v),
              Text(
                "select_fields".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  overflow: TextOverflow.clip,
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.getDropDownHint.isNotEmpty
                      ? controller.getDropDownHint.join(', ')
                      : "select_fields".tr,
                  items: controller.getFields.map((e) {
                    return DropDown(
                      id: e.value,
                      title: e.label.toString(),
                      value: e.value,
                    );
                  }).toList(),
                  onChanged: controller.selectFields,
                ),
              ),
              SizedBox(height: 8.v),
              Obx(
                () => Column(
                  children: controller.fields.map((field) {
                    return visibility(
                      conn: controller,
                      checkboxList: controller.routeValues.value[field.value],
                      visible: field.selected!.value,
                      label: field.label.toString(),
                      control: field.control!,
                      hintText: field.data,
                      value: field.value,
                      onSelect: (option) {
                        console.log(option);

                        if (controller.query.containsKey(option['key'])) {
                          if (option['checked'] == true) {
                            if (controller.query[option['key']]!
                                    .contains(option['value']) ==
                                false) {
                              controller.query[option['key']]
                                  ?.add(option['value']);
                            }
                          }
                          if (option['checked'] == false) {
                            if (controller.query[option['key']]!
                                .contains(option['value'])) {
                              controller.query[option['key']]
                                  ?.remove(option['value']);
                            }
                          }
                        } else {
                          controller.query[option['key']] = [option['value']];
                        }
                        console.log(controller.query.entries, name: 'entries');
                      },
                      onChanged: (val) {
                        console.log({val, field});
                        controller.onChangedField(val, field);
                      },
                      onRemove: () {
                        controller.removeField(field);
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "record_per_page".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.pageSize.value.toString(),
                  items: pageSizeList2.map((e) {
                    return DropDown(
                      id: e,
                      title: e.toString().tr,
                      value: e,
                    );
                  }).toList(),
                  onChanged: (option) {
                    controller.pageSize.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "sort_by".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.by.value?.label ?? "sort_by".tr,
                  items: controller.fields.map((field) {
                    return DropDown(
                      id: field.value,
                      title: field.label.toString(),
                      value: field,
                    );
                  }).toList(),
                  onChanged: (option) {
                    controller.by2.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "order_by".tr,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.v),
              Obx(
                () => SimpleDropDown(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 12.adaptSize),
                    child: CustomImageView(
                      imagePath: "dropdown".icon.svg,
                    ),
                  ),
                  hintText: controller.order.value.tr,
                  items: [
                    DropDown(
                        id: '1', title: 'ascending'.tr, value: 'Ascending'),
                    DropDown(
                        id: '2', title: 'descending'.tr, value: 'Descending'),
                  ],
                  onChanged: (option) {
                    controller.order.value = option?.value;
                  },
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "reset".tr,
                        margin: EdgeInsets.only(right: 4.h),
                        buttonStyle: CustomButtonStyles.fillGray,
                        onPressed: controller.reset,
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "filter".tr,
                        margin: EdgeInsets.only(left: 4.h),
                        onPressed: controller.onPressedFilter,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreate() {
    if (currency.value != null && controller.env.gatewayNodeTag > 0) {
      Get.to(
        () => NewTransactionScreen(
          currencySymbol: currency.value,
          routeValues: TransactionRouteName.fromJson(
            controller.routeValues.value,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "transactions".tr,
              onTapFilter: onTapFilter,
            ),
          ),
          SizedBox(height: 12.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                children: [
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 19.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: onCreate,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              imagePath: "plus_circle".icon.svg,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 7.h,
                                top: 2.v,
                                bottom: 3.v,
                              ),
                              child: Text(
                                "new_transaction".tr,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Obx(
                      //   () => CustomElevatedButton(
                      //     height: 30.v,
                      //     width: 100.h,
                      //     text: controller.props.useState.value == UseState.done
                      //         ? "download".tr
                      //         : "".tr,
                      //     leftIcon:
                      //         controller.props.useState.value == UseState.done
                      //             ? Container(
                      //                 margin: EdgeInsets.only(right: 6.h),
                      //                 child: CustomImageView(
                      //                   imagePath: "download".icon.svg,
                      //                   height: 16.adaptSize,
                      //                   width: 16.adaptSize,
                      //                 ),
                      //               )
                      //             : Container(
                      //                 padding: EdgeInsets.all(6.adaptSize),
                      //                 child: Center(
                      //                   child: CircularProgress(
                      //                     width: 12,
                      //                     height: 12,
                      //                     colorAnimation: appTheme.whiteA700,
                      //                   ),
                      //                 ),
                      //               ),
                      //     buttonStyle: CustomButtonStyles.fillGrayTL4,
                      //     onPressed: controller.download,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 19.v),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () {
                          UseState useState = controller.props.useState.value;
                          UseError error = controller.props.error.value;

                          if (useState == UseState.none ||
                              useState == UseState.loading) {
                            return const CircularProgress();
                          } else {
                            if (error.message != null) {
                              return TryAgain(
                                message: error.message,
                                tryAgain: controller.tryAgain,
                              );
                            }

                            List<Transaction> transactions =
                                controller.transactions;
                            String currencySymbol =
                                controller.currencySymbol.value;
                            currency.value = currencySymbol;
                            if (transactions.isEmpty) {
                              return const NoRecordFound();
                            } else {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: transactions.length,
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 11.v);
                                },
                                itemBuilder: (context, index) {
                                  Transaction transaction = transactions[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.h,
                                      vertical: 4.v,
                                    ),
                                    decoration:
                                        AppDecoration.outlinePrimary2.copyWith(
                                      color: appTheme.lightGreen50,
                                      border: Border.all(
                                        width: 1,
                                        color: appTheme.primary,
                                      ),
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => TransactionDetailsScreen(
                                            currencySymbol: currencySymbol,
                                            transaction: transaction,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${transaction.campaign}',
                                                  style: TextStyle(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(height: 4.v),
                                                Text(
                                                  '${transaction.invoice}',
                                                  style: TextStyle(
                                                    color: appTheme.gray80001,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  transaction.transactionDate ??
                                                      '',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: appTheme.gray80001,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '$currencySymbol${transaction.approvedAmount?.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(height: 4.v),
                                                Text(
                                                  '${transaction.nodeName}',
                                                  style: TextStyle(
                                                    color: appTheme.gray80001,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24.v),
                  SizedBox(height: 8.v),
                  Obx(() {
                    return WebPagination(
                      displayItemCount: 3,
                      currentPage: controller.page.value,
                      totalPage: controller.totalPage.value,
                      onPageChanged: controller.onPageChanged,
                    );
                  }),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
