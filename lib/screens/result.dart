import 'package:flutter/material.dart';
import 'package:sampleapp/screens/bmi.dart';

class Result extends StatelessWidget {
  Result(
      {required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        actions: [Icon(Icons.notifications_none_sharp, color: Colors.grey)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Result',
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(51, 51, 53, 5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color:Color.fromRGBO(51, 51, 53, 100),
                  )),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text('Your Current BMI',style: TextStyle(fontSize: 20,color: Colors.grey),),
                  SizedBox(height: 20,),
                  Text(bmiResult,style: TextStyle(fontSize: 39,color: Colors.white),),
                  Image.asset('images/avg.png',height: 180,
                  width: 290,)

                ],
              ),
            ),
            SizedBox(height: 40,),
            Text( resultText.toUpperCase(),style: TextStyle(fontSize: 30,color: Colors.white),),
            SizedBox(height: 20,),
            Text(interpretation,style: TextStyle(fontSize:19,color: Colors.white),),
            SizedBox(height: 50,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,

              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BMI()));
              }, child: Text('ReCalculate'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(6, 196, 108, 100) , ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
