class Habit {
  String _item = "";
  String _date = "";

  Habit(String item, String date)
  {
    this._item = item;
    this._date = date;
  }

  String getItem()
  {
    return _item;
  }
  String getData()
  {
    return _date;
  }

  Map<String, dynamic> toJson() => {
    "item" : _item,
    "date" : _date,
  };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
     json['item'] as String,
      json['date'] as String,
      );
  
  /*
  @override 
  String toString()
  {
    return "Habit: $_item, Date: $_date";
  }
  */
}