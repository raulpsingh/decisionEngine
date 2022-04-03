import 'package:flutter/material.dart';
import 'package:inbank_app/objects/decision.dart';

class DecisionPage extends StatefulWidget {
  final Decision? decision;
  const DecisionPage({Key? key, required this.decision}) : super(key: key);

  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  late String a;

  void decide() {
    if (widget.decision?.debt == true) {
      a = "You already have a debt";
    } else if (widget.decision?.approved == true) {
      a = "You have been approved to get a loan";
    } else if (widget.decision?.approved == false) {
      a = "You have been rejected to get a loan";
    }
  }

  @override
  Widget build(BuildContext context) {
    String? b = widget.decision?.amount.toString();
    String? c = widget.decision?.period.toString();
    final Size size = MediaQuery.of(context).size;
    final double padHeight = MediaQuery.of(context).size.height;
    decide();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(16, 38, 52, 0.6196078431372549),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.2),
            child: Center(
                child: Text(
              a,
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 20, color: Colors.white),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.05),
            child: Center(
                child: Text(
              "You can get up to $b euros ",
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 20, color: Colors.white),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.05),
            child: Center(
                child: Text(
              "For a period of $c months",
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 20, color: Colors.white),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: padHeight * 0.4),
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
                  Navigator.pop(context);
                },
                child: const Text(
                  "Go back",
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
