import 'package:flutter/material.dart';
import 'constants.dart';


class ResultPage extends StatelessWidget {
  ResultPage({
    required this.condition,
    required this.result,
    required this.discription
});

  final String condition;
  final String result;
  final String discription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
                color: Color(0xFF312F66)
            ),
            scaffoldBackgroundColor: Color(0xFF312F66)
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(flex: 2,child: Center(child: Text('Your Result',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),))),
            Expanded(flex: 7,child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Center(child: Text(condition,style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                  ),))),
                  Expanded(
                    child: Center(
                      child: Text(result,style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  Expanded(child: Center(child: Text(discription,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 22,
                  ),)))
                ],
              ),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kactiveColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            )),
            Expanded(child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF83058)),
                  overlayColor: MaterialStatePropertyAll<Color>(Colors.white30),
                ),
                child: Text('RE-CALCULATE',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 3
                )),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
