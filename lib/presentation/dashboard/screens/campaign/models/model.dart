import '/core/app_export.dart';

class AddCampaignModel {
  Rx<List<DropDown>> dropdownItemList = Rx([
    DropDown(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    DropDown(
      id: 2,
      title: "Item Two",
    ),
    DropDown(
      id: 3,
      title: "Item Three",
    )
  ]);
}
