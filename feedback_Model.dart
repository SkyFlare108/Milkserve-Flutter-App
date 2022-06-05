class FeedbackModel{
  List name;
  List bottles;
  List date;

  FeedbackModel({this.name, this.bottles, this.date});

  factory FeedbackModel.fromJson(dynamic json){
    return FeedbackModel(
      name: List.from(json['name'] ?? []),
      bottles: List.from(json['bottles'] ?? []),
      date: List.from(json['date'] ?? []),
      // bottles: "${json['bottles']}",
      // date: "${json['date']}",
    );
  }

  Map toJson() => {
    "name": name,
    "bottles": bottles,
    "date": date,

  };
}