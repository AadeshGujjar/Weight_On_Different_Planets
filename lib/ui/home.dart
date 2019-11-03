import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _weightController= new TextEditingController();

  int radioValue=0;
  double _finalResult=0.0;
  String _formattedText="";

  void handleRadioValueChanged(int value)
  {
    setState(() {
      radioValue=value;
      switch(radioValue){
        case 0:
          _finalResult=calculateWeight(_weightController.text,0.06);
          _formattedText= "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult=calculateWeight(_weightController.text,0.377);
          _formattedText= "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 2:
          _finalResult=calculateWeight(_weightController.text,0.91);
          _formattedText= "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 3:
          _finalResult=calculateWeight(_weightController.text,0.378);
          _formattedText= "Your weight on Mercury is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 4:
          _finalResult=calculateWeight(_weightController.text,2.34);
          _formattedText= "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 5:
          _finalResult=calculateWeight(_weightController.text,1.06);
          _formattedText= "Your weight on Saturn is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 6:
          _finalResult=calculateWeight(_weightController.text,0.92);
          _formattedText= "Your weight on Uranus is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 7:
          _finalResult=calculateWeight(_weightController.text,1.19);
          _formattedText= "Your weight on Neptune is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
          backgroundColor: Colors.deepPurple,


      ),
        backgroundColor: Colors.grey,

      body: new Container(
        alignment: Alignment.topCenter,
        child:  new ListView(
          padding: const EdgeInsets.all(25.5),
          children: <Widget>[
            new Image.asset('images/earth.png',
            width: 200.0,
            height: 133.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child:  new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                      keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText:"Your Weight on earth",
                      hintText: "In Pounds",
                      icon:  new Icon(Icons.person_outline),
                    ),

                  ),

                  //radio buttons for weights to be done by 3/11/19.

                  



                  new Padding(padding: new EdgeInsets.all(5.0)),

                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       //radio button
                       new Radio<int>(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.grey,),
                       new Text("Pulto", style: new TextStyle(color: Colors.white70),),

                       new Radio<int>(value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.red,),
                       new Text("Mars", style: new TextStyle(color: Colors.white70),),

                       new Radio<int>(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.orange,),
                       new Text("Venus", style: new TextStyle(color: Colors.white70),),

                     ],
                  ),


                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio button
                      new Radio<int>(value: 3, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.blueGrey,),
                      new Text("Mercury", style: new TextStyle(color: Colors.white70),),

                      new Radio<int>(value: 4, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.brown,),
                      new Text("Jupiter", style: new TextStyle(color: Colors.white70),),

                      new Radio<int>(value: 5, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.amber,),
                      new Text("Saturn", style: new TextStyle(color: Colors.white70),),

                    ],
                  ),


                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio button


                      new Radio<int>(value: 6, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.lightBlueAccent,),
                      new Text("Uranus", style: new TextStyle(color: Colors.white70),),

                      new Radio<int>(value: 7, groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.blue,),
                      new Text("Neptune", style: new TextStyle(color: Colors.white70),),


                    ],




                  ),

                  new Padding(padding: new EdgeInsets.all(15.6)),

                  //result text

                  new Text(
                   //   "$_formattedText lbs",
                    _weightController.text.isEmpty?"Please Enter Weight":_formattedText+" lbs.",
                  style:  new TextStyle(
                    color: Colors.white70,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w700
                  ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty&& int.parse(weight)>0) {
      return int.parse(weight)*multiplier;

    }
    else
      print("Enter a correct Input Value");
      return int.parse("180")*0.38;
  }
}