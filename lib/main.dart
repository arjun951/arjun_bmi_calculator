import 'package:flutter/material.dart';
import 'reuseables.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'resultPage.dart';
import 'dart:math';


void main() {
  runApp(MaterialApp(
    title: 'App',
    home: MainPage(),
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
              color: Color(0xFF312F66)
          ),
          scaffoldBackgroundColor: Color(0xFF312F66)
      )
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color maleColor = knoColor;
  Color femaleColor = knoColor;
  int height = 120;
  int weight = 60;
  int age = 20;

  double bmi(){
    double res = weight/(pow(height/100, 2));
    return res;
  }

  void toggleColor(int n){
    if(n==1){
      if(maleColor==kactiveColor){
        maleColor = knoColor;
      }
      else{
        maleColor = kactiveColor;
        femaleColor = knoColor;
      }
    }
    else{
      if(femaleColor==kactiveColor){
        femaleColor = knoColor;
      }
      else{
        femaleColor = kactiveColor;
        maleColor = knoColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(flex: 3,child: Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      toggleColor(1);
                    });
                  },
                  child: mainCard(
                    mainWidget: Icon(Icons.male,size: 80,),
                    writtenText: 'MALE',
                    currentColor: maleColor,
                  ),
                )),
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      toggleColor(2);
                    });
                  },
                  child: mainCard(
                    mainWidget: Icon(Icons.female,size: 80,),
                    writtenText: 'FEMALE',
                    currentColor: femaleColor,
                  ),
                )),
              ],
            )),
            Expanded(flex: 3,child: Container(
              child: mainCard(
                writtenText: 'HEIGHT = $height cm',
                currentColor: kactiveColor,
                mainWidget: SliderTheme(
                  data: SliderThemeData(
                    thumbColor: Colors.red,
                    activeTrackColor: Colors.redAccent,

                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 200,
                    onChanged: (newRating){
                      setState(() {
                        height = newRating.toInt();
                      });
                    },
                  ),
                ),
              ),
            )),
            Expanded(flex: 3,child: Row(
              children: [
                Expanded(child: lowerMainCard(generalText: 'WEIGHT',data: '$weight')),
                Expanded(child: lowerMainCard(generalText: 'AGE',data: '$age')),
              ],
            )),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: (){
                      double result = bmi();
                      String state;
                      String discript;
                      String temp = result.toStringAsFixed(1);
                      if(result<=18.5){
                        state = 'UNDERWEIGHT';
                        discript = 'You have low body weight that normal. Take proper diet.';
                      }
                      else{
                        if(result<=24.9){
                          state = 'NORMAL';
                          discript = 'You have normal body weight. Good Job !';
                        }
                        else{
                          state = 'OVERWEIGHT';
                          discript = 'You have high body weight that normal. You need to forcus on workout.';
                        }
                      }


                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(condition: state,result: temp,discription: discript,)));
                    },
                    child: Text('CALCULATE',style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 3
                    ),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF83058)),
                    overlayColor: MaterialStatePropertyAll<Color>(Colors.white30),
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }

  Container lowerMainCard({required String generalText, required String data}) {
    return Container(
                decoration: BoxDecoration(
                  color: kactiveColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(generalText,style: TextStyle(
                      fontSize: 20
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$data',style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: (){
                          setState(() {
                            if(generalText=='WEIGHT'){
                              weight++;
                            }
                            else{
                              age++;
                            }
                          });
                        }, child: Icon(Icons.add_circle,size: 40,color: Colors.green,)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(onTap: (){
                          setState(() {
                            if(generalText=='WEIGHT'){
                              weight--;
                            }
                            else{
                              age--;
                            }
                          });
                        },child: Icon(CupertinoIcons.minus_circle_fill,size: 40,color: Colors.redAccent,)),
                      ],
                    )
                  ],
                ),
              );
  }
}


