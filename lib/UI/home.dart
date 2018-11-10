import 'package:flutter/material.dart';
double _final_result;
double  result1;
String formatted_text = "";


class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return new  homestate();

  }

}

class homestate extends State<home>{
  int radio_value = 0;
  final TextEditingController heightcontrol = TextEditingController();
  final TextEditingController weightcontrol = TextEditingController();
  double _res;
  var x;

  void _result(){
    setState(() {

      _res =finalfunction(heightcontrol.text,weightcontrol.text);
      formatted_text = _res.toStringAsFixed(2);
      if( double.parse(formatted_text)>24.0 || double.parse(formatted_text) <19 )
        {
           x =Colors.red;
        }
        else
          {
            x=Colors.green;
          }

    });

  }

  void on_changed_radio_value(int value){
    setState(() {
      radio_value = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: new Container(

        color: Colors.white70,
       margin: EdgeInsets.all(2.5),
       alignment: Alignment.center,
       child:new ListView(
         children: <Widget>[
           new Stack(
             children: <Widget>[
               new Container(

                 alignment: Alignment.center,
//             color: Colors.pink,
                 height: 150.0,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
//                   color: Colors.redAccent.shade400,
                   shape: BoxShape.rectangle,
                   borderRadius: new BorderRadius.circular(500.0),
                   gradient: LinearGradient(colors: [Colors.redAccent.shade400,Colors.white70],
                   begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                     stops: [0.4,0.1]
                   )
                 ),
                 margin: const EdgeInsets.only(
                   bottom: 0.0,
                   left: 60.0,
                   right:60.0,
                   top: 0.0,
                 ),

               ),

               new Container(
                 alignment: Alignment.center,
                 height: 100.0,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
//                   color: Colors.redAccent.shade400,
                   shape: BoxShape.rectangle,
                   gradient: LinearGradient(colors: [Colors.redAccent.shade400,Colors.white70],
                   begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                     stops: [0.1,0.9],
                     tileMode: TileMode.clamp,
                   )
                 ),
               ),
               //logo

               new Container(

                 alignment: Alignment.center,
                 height: 130.0,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.only(
                   left: 80.0,
                   top: 78.0,
                   right: 80.0,
                 ),
                 decoration: BoxDecoration(
                   color: Colors.grey.shade400,
                   shape: BoxShape.circle,
                   border: Border.all(
                     width: 5.0,
                     color: Colors.black54
                   )


                 ),

                 child: new Image.asset('images/bmilogo.png',
                   height: 65.0,
                   alignment: Alignment.center,
                 ),

               )

             ],
           ),
           new Padding(padding: EdgeInsets.all(4.5)),


           new Container(
             alignment: Alignment.center,
             height: MediaQuery.of(context).size.height/1.91,
             margin: EdgeInsets.only(
               left: 25.5,
               right: 25.5,
               bottom: 10.0,
               top:2.5
             ),
             decoration: BoxDecoration(
               color: Colors.white,
               shape: BoxShape.rectangle,
               borderRadius: BorderRadius.circular(15.0),
               boxShadow: [
                 new BoxShadow(
                   color: Colors.pinkAccent.shade100,
                   blurRadius: 30.0
                 )
               ]

             ),
             child:Column(
               children: <Widget>[
              new Row(

               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 new Padding(padding: EdgeInsets.all(4.5)),
                 new Text("Gender:",style: TextStyle(fontSize:18.0,fontWeight: FontWeight.w900,color: Colors.black54),),
                 new Padding(padding: EdgeInsets.all(5.5)),
                 new Radio<int>(value: 0, groupValue: radio_value, onChanged: on_changed_radio_value),
                 new Text("M",style: TextStyle(fontSize:19.0,fontWeight: FontWeight.w500)),
                 new Padding(padding: EdgeInsets.all(10.5)),

                 new Radio<int>(value: 1, groupValue: radio_value, onChanged: on_changed_radio_value ,activeColor: Colors.pink,),
                 new Text("F",style: TextStyle(fontSize:19.0,fontWeight: FontWeight.w500)),

               ],
             ),

                 //input height
                 new Padding(padding: EdgeInsets.all(2.5)),
                     new TextField(
                       controller: heightcontrol,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         hintText: "Height in (cm)",
                        hintStyle: TextStyle(fontSize: 15.0),
//                         labelText: "Enter your height",
                         labelStyle: TextStyle(fontWeight: FontWeight.w900),
                         icon: Icon(Icons.show_chart)
                       ),

                     ),

              //input weight
              new Padding(padding: EdgeInsets.all(2.5)),
              new TextField(
                controller: weightcontrol,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                         hintText: "Weight in (kg)",
                        hintStyle: TextStyle(fontSize: 15.0),
//                    labelText: "Enter your Weight",
                    labelStyle: TextStyle(fontWeight: FontWeight.w900),
                    icon: Icon(Icons.accessibility),

                ),

              ),
              new Padding(padding: EdgeInsets.all(8.5)),
                 new RaisedButton(
                   onPressed: _result,
                 child: Text("Calculate",style: TextStyle(color: Colors.black),),
                 color:Colors.grey.shade50,
                   elevation: 5.0,
                   shape: Border.all(
                     color: Colors.pink,
                   )
                 ),
                 new Padding(padding: EdgeInsets.all(14.5)),
                 new Text("$formatted_text",
                 style: TextStyle(color: x,fontWeight: FontWeight.w900,fontSize: 35.0),
                 ),







               ],)





           )





         ],
       ),

    ),
    );
  }

}
var x;
var y;

double finalfunction(String height,String weight) {
  x= int.parse(height);
  y= double.parse(weight);

  result1 = (y/(x*x))*10000;
  _final_result = result1;
  return _final_result;

}