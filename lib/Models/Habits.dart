final String habitsTable = "habits";

class HabitFields
{
  static final String item = 'item';
  static final String date = 'date';
  //static final String id = 'id';
  static final String saveId = 'saveId';
}

class Habit {
  String _item = "";
  String _date = "";
  //int? id;
  int? saveId;

  Habit(String item, String date, [int? saveid])
  {
    this._item = item;
    this._date = date;
    this.saveId = saveid;
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
      json['saveid'] as int,
      );
  
  /*
  @override 
  String toString()
  {
    return "Habit: $_item, Date: $_date";
  }
  */
}