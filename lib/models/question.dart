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
  ),
  Question(
      image:
          "https://4.bp.blogspot.com/-K_S0324sApU/T4aBDOX_SPI/AAAAAAAAABs/umS-FQjyxdI/s1600/pangaea.jpg",
      question:
          'Pada awalnya semua benua menjadi satu, apakah nama dari Benua diatas?',
      optionList: <OptionItem>[
        OptionItem(isKey: true, option: "Pangae"),
        OptionItem(isKey: false, option: "Antartika"),
        OptionItem(isKey: false, option: "Amerika"),
        OptionItem(isKey: false, option: "Afrika"),
      ])
];

class OptionItem {
  final bool isKey;
  final String option;
  OptionItem({required this.isKey, required this.option});
}
