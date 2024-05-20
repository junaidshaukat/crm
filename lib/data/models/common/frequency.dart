class Frequency {
  dynamic id;
  String title;
  String value;
  num noOfRecurring;
  bool isSelected;
  bool variation;

  Frequency({
    this.id,
    this.title = '',
    this.value = 'ONETIME',
    this.noOfRecurring = 1,
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
}
