import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }

}

class HomeState extends State<Home> {

  final TextEditingController height_ctr = new TextEditingController();
  final TextEditingController weight_ctr = new TextEditingController();
  final TextEditingController age_ctr = new TextEditingController();


  double final_result = 0.0;
  double inches = 0.0;
  String result_reading = "";
  String final_bmi = "";

  void _calculateBMI() {
    setState(() {

     /*
    
   BMI	Weight Status
   Below 18.5	Underweight
    18.5 – 24.9	Normal
    25.0 – 29.9	Overweight
    30.0 and Above	Obese

    */

      int age = int.parse(age_ctr.text);
      double height = double.parse(height_ctr.text);
      double weight = double.parse(weight_ctr.text);
      inches = height *12;

      if((age_ctr.text.isNotEmpty || age > 0) && (height_ctr.text.isNotEmpty || inches > 0)
      && (weight_ctr.text.isNotEmpty || weight > 0)){
        // Our BMI
        final_result = weight / (inches * inches) * 703;
        
        if(double.parse(final_result.toStringAsFixed(1)) < 18.5) {

          result_reading = "Underweight";
          print(result_reading);

        } else if (double.parse(final_result.toStringAsFixed(1)) >= 18.5
            && final_result < 25 ){
          result_reading = "Great Shape!";

          } else if (double.parse(final_result.toStringAsFixed(1)) >= 25.0
            && final_result < 30 ){
          result_reading = "Overweight";

        } else if (double.parse(final_result.toStringAsFixed(1)) >= 30.0){
             result_reading = "Obese";
        }
        
      } else {

        final_result = 0.0;
      }
      });

    final_bmi = "Your BMI: ${final_result.toStringAsFixed(1)}";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI",
          style: new TextStyle(
              color: Colors.black
          ),),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),

      backgroundColor: Colors.green,

      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: const EdgeInsets.all(5.5),
            children: <Widget>[
              new Image.asset('images/bmi_app_logo.png',
                height: 133.0,
                width: 200.0,),

              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[

                    //Age text field
                    new TextField(
                      controller: age_ctr,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Age",
                          icon: new Icon(Icons.person_outline,
                            color: Colors.black,)

                      ),
                    ),

                    // Height text field
                    new TextField(
                      controller: height_ctr,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height in feet",
                          hintText: "eg. 5.5",
                          icon: new Icon(Icons.assessment,
                            color: Colors.black,)

                      ),
                    ),

                    // Weight text field
                    new TextField(
                      controller: weight_ctr,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Weight in lb",
                          hintText: "eg. 180.1",
                          icon: new Icon(Icons.accessibility,
                            color: Colors.black,)

                      ),
                    ),

                    new Padding(padding: new EdgeInsets.all(15.6)),

                    //calculate button
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: _calculateBMI,
                        color: Colors.yellow,
                        child: new Text('Calculate'),
                        textColor: Colors.black,),

                    ),


                    new Padding(padding: new EdgeInsets.all(15.6)),



                  ],
                ),
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("$final_bmi",
                    style: new TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9
                    ),),

                  new Padding(padding: new EdgeInsets.all(15.6)),

                  new Text("$result_reading",
                    style: new TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9
                    ),)

                ],
              ),
            ],

          )


      ),

    );
  }


}