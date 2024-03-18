class Frequency {
  dynamic id;
  String title;
  dynamic value;
  dynamic noOfRecurring;
  bool isSelected;
  bool variation;

  Frequency({
    this.id,
    this.title = '',
    this.value,
    this.noOfRecurring,
    this.isSelected = false,
    this.variation = false,
  });

  toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'noOfRecurring': noOfRecurring,
      'isSelected': isSelected,
      'variation': variation,
    };
  }

  static List<Frequency> frequencies = [
    Frequency(
      id: "1",
      title: "ONE-TIME",
      value: "ONETIME",
      variation: false,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "DAILY",
      value: "DAILY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "WEEKLY",
      value: "WEEKLY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "BIWEEKLY",
      value: "BIWEEKLY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "MONTHLY",
      value: "MONTHLY",
      variation: true,
      noOfRecurring: 1,
    ),
  ];
}
