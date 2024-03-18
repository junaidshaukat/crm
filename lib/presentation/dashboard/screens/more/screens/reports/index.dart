import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});
  final controller = Get.put(ReportsController());

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
              title: "reports".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.v),
                    const Center(child: CustomDivider()),
                    SizedBox(height: 19.v),
                    Text(
                      "reports".tr,
                      style: TextStyle(
                        color: appTheme.gray80001,
                        fontSize: 16.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3.v),
                    Obx(
                      () => SizedBox(
                        height: 50.v,
                        child: SimpleDropDown(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 12.adaptSize),
                            child: CustomImageView(
                              imagePath: "dropdown".icon.svg,
                            ),
                          ),
                          hintText: controller.reportDataSelect.value?.name ??
                              'select'.tr,
                          items: controller.reportData.map((e) {
                            return DropDown(
                                id: e.tagNumber, title: e.name!, value: e);
                          }).toList(),
                          onChanged: controller.onChangedForm,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.v),
                    Obx(() {
                      Rx<UseState> useState =
                          controller.propsReportForm.useState;
                      if (useState.value == UseState.none) {
                        return SizedBox(
                          height: 240.v,
                          child: NoRecordFound(
                            height: 144.v,
                            size: 60.v,
                          ),
                        );
                      } else {
                        if (useState.value == UseState.loading) {
                          return SizedBox(
                            height: 240.v,
                            child: const CircularProgress(),
                          );
                        } else {
                          List<ReportFormData> form = controller.reportFormData;

                          if (form.isEmpty) {
                            return SizedBox(
                              height: 240.v,
                              child: NoRecordFound(
                                height: 144.v,
                                size: 60.v,
                              ),
                            );
                          } else {
                            return ReportsCard(
                              form: form,
                              formKey: controller.formKey,
                              filter: controller.filter,
                              useState: controller.props.useState,
                              report: controller.reportDataSelect.value,
                              onGenerateReport: controller.onGenerateReport,
                            );
                          }
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportsCard extends StatelessWidget {
  final List<ReportFormData>? form;
  final ReportData? report;
  final Rx<UseState> useState;
  final Map<String, dynamic> filter;
  final GlobalKey<FormState> formKey;
  final void Function()? onGenerateReport;

  const ReportsCard({
    super.key,
    this.form,
    this.report,
    this.onGenerateReport,
    required this.useState,
    required this.filter,
    required this.formKey,
  });

  Widget inputController({
    required ReportFormData field,
  }) {
    Rx<String?> rx = Rx(null);
    Rx<DropDown?> dropDown = Rx(null);
    TextEditingController? textEditingController =
        TextEditingController(text: field.defaultValue);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.v),
        Text(
          "${field.label}",
          style: TextStyle(
            color: appTheme.black900,
            fontSize: 15.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4.v),
        if (field.control == 'textbox')
          Obx(() {
            String? hintText;
            if (rx.value != null) {
              hintText = rx.value;
              Map<String, dynamic> map = {};
              map[field.name!] = rx.value;
              filter.addAll(map);
            } else {
              if (textEditingController.text.isNotEmpty) {
                hintText = textEditingController.text;
                Map<String, dynamic> map = {};
                map[field.name!] = hintText;
                filter.addAll(map);
              } else {
                hintText = field.label.toString().tr;
              }
            }

            return InputForm(
              controller: textEditingController,
              hintText: hintText,
              onChanged: (val) {
                Map<String, dynamic> map = {};
                map[field.name!] = val;
                filter.addAll(map);
                console.log(filter);
              },
              validator: (input) {
                if (field.required == true) {
                  if (input == null || input == '') return 'input is required';
                  return null;
                } else {
                  return null;
                }
              },
            );
          }),
        if (field.control == 'date')
          Obx(() {
            String? hintText;
            if (rx.value != null) {
              hintText = rx.value;
              Map<String, dynamic> map = {};
              map[field.name!] = rx.value;
              filter.addAll(map);
            } else {
              if (textEditingController.text.isNotEmpty) {
                hintText = textEditingController.text;
                Map<String, dynamic> map = {};
                map[field.name!] = hintText;
                filter.addAll(map);
              } else {
                hintText = 'yyyy-mm-dd'.tr;
              }
            }

            return InputForm(
              readOnly: true,
              controller: textEditingController,
              hintText: hintText,
              onChanged: (val) {
                Map<String, dynamic> map = {};
                map[field.name!] = val;
                filter.addAll(map);
              },
              onTap: () {
                Pickers.date(Get.context!).then((val) {
                  if (val != null) {
                    rx.value = val.format('yyyy-MM-dd');
                    Map<String, dynamic> map = {};
                    map[field.name!] = val;
                    textEditingController.text = val.format('yyyy-MM-dd');
                    filter.addAll(map);
                  }
                });
              },
              validator: (input) {
                if (field.required == true) {
                  return ValidatorReport.date(
                    input,
                    field.label,
                    isRequired: true,
                  );
                } else {
                  return null;
                }
              },
            );
          }),
        if (field.control == 'list')
          Obx(() {
            String? hintText;

            if (dropDown.value != null) {
              hintText = dropDown.value?.title;
            } else {
              field.values?.forEach((e) {
                if (e.value == field.defaultValue) {
                  dropDown.value = DropDown(
                    id: e.value,
                    title: "${e.label}",
                    value: e.value,
                  );
                  hintText = dropDown.value?.title;
                  Map<String, dynamic> map = {};
                  map[field.name!] = dropDown.value?.value;
                  filter.addAll(map);
                }
              });
            }

            return SimpleDropDown(
              hintText: hintText,
              items: field.values?.map((e) {
                return DropDown(
                  id: e.value,
                  title: "${e.label}",
                  value: e.value,
                );
              }).toList(),
              onChanged: (option) {
                dropDown.value = option;
                Map<String, dynamic> map = {};
                map[field.name!] = option?.value;
                filter.addAll(map);
              },
            );
          }),
        if (field.control == 'checkboxList')
          Wrap(
            children: field.values!.map((box) {
              console.log(box.toJson());
              RxBool checkbox = RxBool(false);

              return FittedBox(
                child: InkWell(
                  onTap: () {
                    checkbox.toggle();
                    if (checkbox.isFalse) {
                      if (filter.containsKey(field.name!)) {
                        filter[field.name!].remove(box.value);
                      }
                    } else {
                      if (filter.containsKey(field.name!)) {
                        filter[field.name!].add(box.value);
                      } else {
                        filter[field.name!] = [box.value];
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: checkbox.value,
                          onChanged: (checked) {
                            checkbox.value = checked!;
                            if (checkbox.isFalse) {
                              if (filter.containsKey(field.name!)) {
                                filter[field.name!].remove(box.value);
                              }
                            } else {
                              if (filter.containsKey(field.name!)) {
                                filter[field.name!].add(box.value);
                              } else {
                                filter[field.name!] = [box.value];
                              }
                            }
                          },
                        ),
                      ),
                      Text("${box.label}"),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
      ],
    );
  }

  void onPressed() {
    if (formKey.currentState!.validate()) {
      onGenerateReport!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.v),
            Text(
              "description".tr,
              style: TextStyle(
                color: appTheme.gray80001,
                fontSize: 16.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.v),
            SizedBox(
              child: Text(
                "${report!.description}",
                maxLines: 9,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: form!.map((field) {
                  return inputController(
                    field: field,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.v),
            Obx(
              () => CustomElevatedButton(
                text:
                    useState.value == UseState.none ? "generate_report".tr : "",
                leftIcon: useState.value == UseState.none
                    ? null
                    : CustomProgressButton(
                        lable: 'processing'.tr,
                      ),
                onPressed: onPressed,
              ),
            ),
            SizedBox(height: 16.v),
          ],
        ),
      ),
    );
  }
}
