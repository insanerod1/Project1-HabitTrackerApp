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
  
  @override 
  String toString()
  {
    return "Habit: $_item, Date: $_date";
  }
}