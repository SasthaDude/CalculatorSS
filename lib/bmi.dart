import 'dart:math';

import 'package:flutter/material.dart';


class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {

  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController calu = TextEditingController();
  String bmiRes = " ";


  bmiCalc(){
    double wei =double.parse(weight.text);
    double hei = double.parse(height.text);


    double bmi = wei / ((hei/100)* (hei/100));
    calu.text = bmi.toStringAsFixed(2);

    setState(() {
      if(bmi<18.5){
        bmiRes = "underweight";
      }
      else if (bmi>=18.5 && bmi<=24.9){
        bmiRes= "Normal weight";
      }
      else if (bmi>=25 && bmi<=29.9){
        bmiRes= "overweight";
      }
      else if (bmi>30){
        bmiRes= "obesity";
      }
    });


    if(bmi<18.5){
      return "underweight";
    }
    else if (bmi>=18.5 && bmi<=24.9){
      return "Normal weight";
    }
    else if (bmi>=25 && bmi<=29.9){
      return "overweight";
    }
    else if (bmi>30){
      return "obesity";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR"),
        ),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Weight in KG:",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 180,
                height: 80,
                child: TextFormField(
                  style: TextStyle(
                      fontSize: 30
                  ),
                  controller: weight,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Height in cm:", style: TextStyle(
                fontSize: 25,
                color: Colors.pink,
                fontWeight: FontWeight.w500,
              ),
              ),
              Container(
                width: 180,
                height: 80,
                child: TextFormField(
                  style: TextStyle(
                      fontSize: 30
                  ),
                  controller: height,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: ()
            {
              bmiCalc();
            },
            child: Text("CALCULATE"),
          ),
          SizedBox(height: 50,),

          Container(
            height: 300,
            width: 370,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              color: Colors.green.shade900,
            ),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Your Body Mass Index", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("BMI is",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 80,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 30
                        ),
                        controller: calu,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Result:", style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink, fontWeight: FontWeight.w500,

                    ),
                    ),
                    Text("$bmiRes", style: TextStyle(fontSize: 40,
                        color: Colors.orange),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
