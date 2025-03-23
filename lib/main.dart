import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  double size=0;
  String inputVal="";
  String calculatedValue="";
  String operator="";

  @override
  Widget build(BuildContext context) {

   size=MediaQuery.of(context).size.width/5; 

    return  MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: Column(
                children:[

                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(inputVal,
                    style:TextStyle(color:Colors.white,fontSize:100)),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                            calcButton("7",Colors.grey),
                            calcButton("8",Colors.grey),
                            calcButton("9",Colors.grey),
                            calcButton("/",Colors.orange),
                  ],
                  ),Row(
                        children: [
                            calcButton("4",Colors.grey),
                            calcButton("5",Colors.grey),
                            calcButton("6",Colors.grey),
                            calcButton("*",Colors.orange),
                  ],
                  ),Row(
                        children: [
                            calcButton("1",Colors.grey),
                            calcButton("2",Colors.grey),
                            calcButton("3",Colors.grey),
                            calcButton("-",Colors.orange),
                  ],
                  ),Row(
                        children: [
                            calcButton("0",Colors.grey),
                            calcButton(".",Colors.grey),
                            calcButton("=",Colors.orange),
                            calcButton("+",Colors.orange),
                  ],
                  ),
                  calcButton("Clear",Colors.black)
                  ],)
              ]    ),
      ),
    );
  }

    Widget calcButton(String text,Color bgcolor){
      return InkWell(
        onTap: (){
          if(text=="Clear"){
              setState(() {
            inputVal="";
            calculatedValue="";
            operator="";
          });
          }
          else if(text=='+' || text=='-' || text=='*' || text=='/'){
              setState(() {
                calculatedValue=inputVal;
                inputVal="";  
                operator=text;
              });
          }    
          else if(text=="="){
            setState(() {
  if (calculatedValue.isEmpty || inputVal.isEmpty) {
    inputVal = "Error";  // Handle invalid input gracefully
    return;
  }

  double calc = double.tryParse(calculatedValue) ?? 0.0;
  double input = double.tryParse(inputVal) ?? 0.0;

  if (operator == "+") {
    inputVal = (calc + input).toString();
  } 
  else if (operator == "-") {
    inputVal = (calc - input).toString();
  } 
  else if (operator == "*") {
    inputVal = (calc * input).toString();
  } 
  else if (operator == "/") {
    inputVal = input != 0 ? (calc / input).toString() : "Error";
  }
});}

          else{
            setState(() {
            inputVal+=text;
          });
          } 
        },
        child: Container(
                    decoration:BoxDecoration(
                              color:bgcolor,
                              borderRadius:BorderRadius.circular(100),
                              ),
                              margin:EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height:size,
                              width:size,
                              alignment:Alignment.center,
                              child:Text(text,style:TextStyle(color:Colors.white,fontSize:20),)
                            ),
      );

    }  
}
