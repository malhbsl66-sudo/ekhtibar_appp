import 'question.dart';

class AppBrain {
  int _questionN = 0;

  final List<Question> _questiongroup = [
    Question(
      questionText:
          "لغة باثيون من اشهر لغات البرمجه وتستخدم بكثره في الذكاء الاصطناعي",
      questionImages: "images/img01.jpg",
      questionAnswers: true,
    ),
    Question(
      questionText:
          "الحيتان تعتبر من الاسماك لانها تعيش في الماء وتتنفس بالخياشيم ",
      questionImages: "images/img02.png",
      questionAnswers: false,
    ),
    Question(
      questionText:
          "الصحراء الكبرى هي اكبر صحراء رمليه في العالم وتقع في شمال افريقيا",

      questionImages: "images/img03.png",
      questionAnswers: true,
    ),

    Question(
      questionText: "الانترنت كان متاح للعامة منذ بداية السبعينيات الميلادية",
      questionImages: "images/img04.webp",
      questionAnswers: false,
    ),
    Question(
      questionText: "كوكب الارض هو الكوكب الوحيد المعروف بوجود حياة حتى الان",
      questionImages: "images/img05.png",
      questionAnswers: true,
    ),
    Question(
      questionText:
          "الارض التي نعيش فيها هي ارض مسطحه وليست كرويه كما يزعم البعض",
      questionImages: "images/img06.jpeg",
      questionAnswers: false,
    ),
    Question(
      questionText:
          "الصينيون القدماء اول من اسخدم البارود في الحروب لصناعة الاسلحه و المتفجرات",
      questionImages: "images/img07.png",
      questionAnswers: true,
    ),
  ];
  void nextQuetion() {
    if (_questionN < _questiongroup.length - 1) {
      _questionN++;
    }
  }

  String getQuestionText() {
    return _questiongroup[_questionN].questionText;
  }

  String getQuestionimage() {
    return _questiongroup[_questionN].questionImages;
  }

  bool getQuestinonAnswer() {
    return _questiongroup[_questionN].questionAnswers;
  }

  bool end() {
    if (_questionN == _questiongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionN = 0;
  }
}
