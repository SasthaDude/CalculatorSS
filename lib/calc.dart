import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  final TextEditingController _textEditingController = TextEditingController();
  String n1 = "";
  String n2 = "";
  String opr = "";
  bool clk=false;
  String output = '';

  void clearOutput() {
    setState(() {
      output  = '';
      n1 = '';
      n2 = '';
      opr = '';
      clk = false;
      _textEditingController.text= '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.compare_arrows, color: Colors.white,),
                Icon(Icons.calculate, color: Colors.white,),
                Icon(Icons.apps_sharp, color: Colors.white,),
                Icon(Icons.other_houses_outlined, color: Colors.white,),
                Icon(Icons.more_vert, color: Colors.white,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomRight,
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: _textEditingController,
                style: TextStyle(
                  fontSize: 60,
                ),
                decoration: InputDecoration(
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Container(
            height: 510,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            clearOutput();
                          },
                          child: Text("AC", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(_textEditingController.text.isNotEmpty){
                              setState(() {
                                _textEditingController.text = _textEditingController.text.substring
                                  (0, _textEditingController.text.length - 1);
                              });
                            }
                          },
                          child: Text("DEL", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text="MOD";
                            opr="MOD";
                            clk=true;
                          },
                          child: Text("MOD", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(_textEditingController.text.isNotEmpty){
                              double operand = double.parse(_textEditingController.text);
                              double result = operand * operand;
                              _textEditingController.text = result.toStringAsFixed(0);
                              n1 = _textEditingController.text;
                              n2 = '';
                              clk = false;
                              opr = '';
                            }
                          },
                          child: Text("x²", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        //shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if (_textEditingController.text.isNotEmpty) {
                              double operand = double.parse(_textEditingController.text);
                              double result = sqrt(operand);
                              _textEditingController.text = result.toStringAsFixed(0);
                              n1 = _textEditingController.text;
                              n2 = '';
                              clk = false;
                              opr = '';
                            }
                          },
                          child: Text("√", style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),

                    ),
                    Container(
                      height:70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: (){
                            if(_textEditingController.text.isNotEmpty){
                              double operand = double.parse(_textEditingController.text);
                              double result = operand / 100;
                              _textEditingController.text = result.toStringAsFixed(2);
                              n1 = _textEditingController.text;
                              n2='';
                              clk = false;
                              opr = '';
                            }
                          },
                          child: Text("%", style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text="÷";
                            opr="÷";
                            clk=true;

                          },
                          child: Text("÷", style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="7";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="7";
                              _textEditingController.text=n1;
                            }
                          },
                          child: Text("7", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="8";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="8";
                              _textEditingController.text=n1;
                            }
                          },
                          child: Text("8", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="9";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="9";
                              _textEditingController.text=n1;
                            }
                          },
                          child: Text("9", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text="x";
                            opr="x";
                            clk=true;

                          },
                          child: Text("x", style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="4";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="4";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("4", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="5";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="5";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("5", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="6";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="6";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("6", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text="-";
                            opr="-";
                            clk=true;

                          },
                          child: Text("-", style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="1";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="1";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("1", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="2";
                              _textEditingController.text=n2;
                            }
                            else
                            {
                              n1+="2";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("2", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk){
                              n2+="3";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1+="3";
                              _textEditingController.text=n1;
                            }
                          },
                          child: Text("3", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text="+";
                            opr="+";
                            clk=true;

                          },
                          child: Text("+", style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,),

                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(_textEditingController.text.isNotEmpty){
                              double a = double.parse(_textEditingController.text);
                              a *= -1;
                              _textEditingController.text = a.toString();
                            }
                          },
                          child: Text("+/-", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            if(clk=true){
                              n2="0";
                              _textEditingController.text=n2;
                            }
                            else{
                              n1="0";
                              _textEditingController.text=n1;
                            }

                          },
                          child: Text("0", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            _textEditingController.text=".";

                          },
                          child: Text(".", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:60,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap:(){
                            double a=double.parse(n1);
                            double b=double.parse(n2);
                            double res=0;
                            if(opr=="+"){
                              res=a+b;
                            }
                            else if(opr=="-"){
                              res=a-b;
                            }
                            else if(opr=="x")
                            {
                              res=a*b;
                            }
                            else if(opr=="÷")
                            {
                              res=a/b;
                            }
                            // else if(opr=="%")
                            //   {
                            //     res=a%b;
                            //   }
                            else if (opr == "MOD")
                            {
                              res = a % b;
                            }
                            _textEditingController.text=res.toString();
                            n1=_textEditingController.text;
                            n2="";
                            clk=false;
                          },
                          child: Text("=", style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),

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
