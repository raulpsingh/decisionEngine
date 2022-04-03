import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inbank_app/functions/decisionEngine.dart';
import 'package:inbank_app/functions/widgets.dart';
import 'package:inbank_app/objects/consts.dart';
import 'package:inbank_app/pages/decision_page.dart';
import '../objects/decision.dart';

int amountIndex = 0;
int periodIndex = 0;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _personalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(16, 38, 52, 0.6196078431372549),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.1),
            child: const Center(
                child: Text(
              "Decision engine",
              style: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.1),
            child: Row(
              children: const [
                Text(
                  "Personal code",
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          input("Input your personal code", _personalController),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.05),
            child: Row(
              children: const [
                Text(
                  "Please choose an amount",
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: CupertinoPicker(
                itemExtent: 64,
                onSelectedItemChanged: (_index) {
                  setState(() {
                    amountIndex = _index;
                  });
                },
                children: Constraints.amounts
                    .map((item) => Center(
                            child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Lato",
                              color: Colors.white),
                        )))
                    .toList()),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.05),
            child: Row(
              children: const [
                Text(
                  "Please choose a period",
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: CupertinoPicker(
                itemExtent: 64,
                onSelectedItemChanged: (_index) {
                  setState(() {
                    periodIndex = _index;
                  });
                },
                children: Constraints.periods
                    .map((item) => Center(
                            child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Lato",
                              color: Colors.white),
                        )))
                    .toList()),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.05),
            child: Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(16, 38, 52, 0.6196078431372549)),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () {
                  Decision? a = DecisionEngine.decide(
                      _personalController.text,
                      Constraints.amounts[amountIndex],
                      Constraints.periods[periodIndex]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => DecisionPage(decision: a)));
                },
                child: const Text(
                  "Decide",
                  style: TextStyle(
                      fontSize: 18, fontFamily: "Lato", color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
