class CardModel {
  CardModel(this.question, this.answer);

  final String question;
  final String answer;

  @override
  String toString() {
    return 'CardModel{question: $question, answer: $answer}';
  }
}

class CardModelFactory {
  CardModelFactory._();

  static List<CardModel> create() {
    return [
      CardModel("이게 맞나?", "몰?루"),
      CardModel("정말 맞나?", "모르겠다니까?"),
      CardModel("진짜?", "🫠"),
    ];
  }
}
