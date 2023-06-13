import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/Bmi_Result_Screen.dart';


class BmiScreen extends StatefulWidget {


  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {


bool isMale = true;
double height = 120;
int weight =40;
int age =20;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded (
                child: GestureDetector( onTap: (){
                  setState(() {
                    isMale =true;


                  });
                },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: isMale? Colors.blue : Colors.grey[300] ),child: Column(mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Image(image: AssetImage('assets/images/Male.png'),height: 90,width: 90,),
                      SizedBox(height: 15.0,),
                      Text('Male',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                ),
              ),
              SizedBox(width: 15.0,),
              Expanded (
                child: GestureDetector( onTap: (){
                  setState(() {
                    isMale = false;
                  });
                },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: !isMale? Colors.blue : Colors.grey[300]),child: Column(mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image(image: AssetImage('assets/images/Female.png'),height: 90,width: 90,),
                      SizedBox(height: 15.0,),
                      Text('Female',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)
                    ],),
                  ),
                ),
              ),
            ],),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.grey[300]),
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hieght',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                 Row(crossAxisAlignment:CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Text('${height.round()}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900),),
                   SizedBox(width: 5.0,),
                   Text('CM',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900),),
                 ],),
                  Slider(value:height,
                      max: 220.0,
                      min: 80.0, onChanged:(value){
                   setState(() {
                     height = value;
                   });
                      } )

                ],
              ),
            ),
          )),
          Expanded (child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded(
                child: Container(
                  child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                    Text('Age',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    Text('${age.round()}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900),),
                    Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                      FloatingActionButton(onPressed: ( ){
                        setState(() {
                          age--;
                        });
                      }, mini: true,heroTag: 'age-',
                        child: Icon(Icons.remove) ,
                      ),
                      FloatingActionButton(onPressed: ( ){ setState(() {
                        age++;
                      });}, mini: true,heroTag: 'age+',
                        child: Icon(Icons.add) ,
                      )
                    ],)

                  ],),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.grey[300]),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Container(
                  child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
                    Text('Weight',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    Text('${weight.round()}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900),),
                    Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                      FloatingActionButton(onPressed: ( ){
                        setState(() {
                          weight--;
                        });
                      }, mini: true,heroTag: 'weight-',
                        child: Icon(Icons.remove) ,
                      ),
                      FloatingActionButton(onPressed: ( ){
                        setState(() {
                          weight++;
                        });
                      } , mini: true, heroTag: 'weight+',
                        child: Icon(Icons.add) ,
                      )
                    ],)

                  ],),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.grey[300]),
                ),
              ),

            ],),
          )),
          Container(width: double.infinity, color: Colors.blue,
            child: MaterialButton(onPressed: (){

              double result = weight / pow(height/ 100, 2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiResultScreen(age: age,
              result: result.round(),isMale: isMale,)));
            },
            child: Text('Calculate',style: TextStyle(color: Colors.white),),),

          )
        ],
      ),
    );
  }
}

