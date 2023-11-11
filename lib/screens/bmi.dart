import 'package:flutter/material.dart';
import 'package:sampleapp/calculate.dart';
import 'package:sampleapp/screens/result.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

enum Gender {
  male,
  female,
}

class _BMIState extends State<BMI> {
  Gender? selectedGender;
  int height = 180;

  String? valuechoose, valuechoose2;
  int weight = 50;
  int age = 20;
  bool isSelected = false;
  List items = [
    "Kg",
    "g",
  ];
  List items2 = [
    "Cm",
    "M",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        actions: [Icon(Icons.notifications_none_sharp, color: Colors.grey)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Gender',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 51, 53, 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: selectedGender == Gender.male
                              ? Color.fromRGBO(6, 196, 108, 100)
                              : Color.fromRGBO(51, 51, 53, 100),
                        )),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.man,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: selectedGender == Gender.male
                                  ? Color.fromRGBO(6, 196, 108, 100)
                                  : Color.fromRGBO(51, 51, 53, 100),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(6, 196, 108, 100),
                              ),
                            ),
                            child: selectedGender == Gender.male
                                ? Icon(
                                    Icons.check,
                                    size: 16.0,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 51, 53, 100),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: selectedGender == Gender.female
                              ? Color.fromRGBO(6, 196, 108, 100)
                              : Color.fromRGBO(51, 51, 53, 100),
                        )),
                    child: Stack(
                      children: [
                        Center(
                            child: Icon(
                          Icons.woman,
                          color: Colors.white,
                          size: 100,
                        )),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: selectedGender == Gender.female
                                  ? Color.fromRGBO(6, 196, 108, 100)
                                  : Color.fromRGBO(51, 51, 53, 100),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(6, 196, 108, 100),
                              ),
                            ),
                            child: selectedGender == Gender.female
                                ? Icon(
                                    Icons.check,
                                    size: 16.0,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Weight',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ))),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 65,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 28,
                              child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Text(weight.toString()),
                            Container(
                              height: 28,
                              child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Card(
                      child: Container(
                        height: 60,
                        child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            hint: Text(
                              'Kg',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            value: valuechoose,
                            items: items
                                .map((type) => DropdownMenuItem<String>(
                                      value: type.toString(),
                                      child: Text(
                                        type.toString(),
                                        style: TextStyle(color: Colors.black),
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (type) {
                              setState(() {
                                valuechoose = type;
                              });
                            }),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Height',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ))),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 66,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 28,
                              child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    height--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Text(height.toString()),
                            Container(
                              height: 28,
                              child: FloatingActionButton(
                                backgroundColor: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    height++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Card(
                      child: Container(
                        height: 60,
                        child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            hint: Text(
                              'Cm',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            value: valuechoose2,
                            items: items2
                                .map((type) => DropdownMenuItem<String>(
                                      value: type.toString(),
                                      child: Text(
                                        type.toString(),
                                        style: TextStyle(color: Colors.black),
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (type) {
                              setState(() {
                                valuechoose2 = type;
                              });
                            }),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Age',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ))),
            Container(
              height: 60,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28,
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Text('56'),
                    Container(
                      height: 28,
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: Card()),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  BmiLogic calc = BmiLogic(height: height, weight: weight);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Result(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )));
                },
                child: Text('Calculate'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(6, 196, 108, 100),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
