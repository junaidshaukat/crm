import '/core/app_export.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel {}

class MenuCardModel {
  String? id;
  String? title;
  Rx<String>? subtitle;
  Rx<String>? content;
  String? imagePath;
  bool more;

  MenuCardModel({
    this.id,
    this.title,
    this.subtitle,
    this.content,
    this.imagePath,
    this.more = false,
  });
}
