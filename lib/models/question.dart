class Question {
  String? image;
  String question;
  List<OptionItem> optionList;

  Question({this.image = '', required this.question, required this.optionList});
}

var questionList = [
  Question(
    question: 'Dimanakah ibukota Indonesia',
    optionList: <OptionItem>[
      OptionItem(isKey: true, option: 'Jakarta'),
      OptionItem(isKey: false, option: 'Sumatera'),
      OptionItem(isKey: false, option: 'Semarang'),
      OptionItem(isKey: false, option: 'Yogyakarta'),
    ],
  ),
  Question(
    question: 'Siapakah nama pahlawan dari aceh?',
    optionList: <OptionItem>[
      OptionItem(isKey: false, option: 'R.A Kartini'),
      OptionItem(isKey: false, option: 'Ratu Kalinyamat'),
      OptionItem(isKey: true, option: 'Cut Nyak Dien'),
      OptionItem(isKey: false, option: 'Pattimura'),
    ],
  )
];

class OptionItem {
  final bool isKey;
  final String option;
  OptionItem({required this.isKey, required this.option});
}
