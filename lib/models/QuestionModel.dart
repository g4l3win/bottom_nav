//objek class list data{
class QuestionModel {
  String? question; //ini buat list yang diatas
  String? answer; // ini yang buat list yang dibawah

  QuestionModel({this.question, this.answer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'] ?? "-";
    answer = json['answer'] ?? "-";
  }
}
