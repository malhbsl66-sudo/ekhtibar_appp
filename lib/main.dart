import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'app_brain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "اختبار معلومات عامة",
            style: TextStyle(
              color: Color.fromARGB(255, 248, 245, 244),
              fontWeight: FontWeight.w800,
              fontSize: 30.0,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 80, 172, 4),
        ),
        backgroundColor: const Color.fromARGB(255, 167, 243, 243),
        body: Tests(),
      ),
    );
  }
}

class Tests extends StatefulWidget {
  @override
  _TestsState createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  List<Widget> answer = [];
  int goo = 0;

  void checkAnswer(bool whatUserPickad) {
    bool correctAnswer = appBrain.getQuestinonAnswer();
    setState(() {
      if (whatUserPickad == correctAnswer) {
        goo++;
        answer.add(
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(Icons.thumb_up, color: Colors.lightGreen),
          ),
        );
      } else {
        answer.add(
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }

      if (appBrain.end() == true) {
        Alert(
          context: context,
          title: "انهيت الاختبار",
          desc: " لقد اجبت على $goo اسئله صحيحه من اصل 7",
          buttons: [
            DialogButton(
              color: Colors.pink,
              child: Text(
                "ابدء من جديد",

                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            ),
          ],
        ).show();

        appBrain.reset();

        answer = [];

        goo = 0;
      } else {
        appBrain.nextQuetion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answer),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(appBrain.getQuestionimage()),
              ),
            ],
          ),
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.0, right: 1.0),
              child: Text(
                appBrain.getQuestionText(), //اااااا

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 13, 14, 13),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 25.0,
              bottom: 15.0,
            ),

            child: ElevatedButton(
              child: Text(
                'صح',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 241, 241, 241),
                ),
              ),
              onPressed: () {
                checkAnswer(true);

                //questionN = questionN + 1;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 64, 71, 170),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 15.0,
              bottom: 15.0,
            ),
            child: ElevatedButton(
              child: Text(
                "خطاء",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 247, 244, 245),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 199, 54, 54),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
