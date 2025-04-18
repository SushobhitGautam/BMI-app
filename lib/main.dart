import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       appBarTheme: AppBarTheme(
         backgroundColor: Colors.deepPurple,
       )
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result  = " ";
  var bgColor= Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('yourBMI')),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[
                bgColor.withOpacity(0.9), // Use bgColor dynamically
                Color(0xffd57eeb),
              ]
          )
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34)),
                SizedBox(height: 11),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight (in Kg)', style: TextStyle(fontSize: 20)),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Feet)', style: TextStyle(fontSize: 20)),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Inch)', style: TextStyle(fontSize: 20)),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 25),
                ElevatedButton(

                  onPressed: () {
                    var wt = wtController.text.trim();
                    var ft = ftController.text.trim();
                    var inch = inController.text.trim();

                    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var intInch = int.parse(inch);
                      var tInch = (ift * 12) + intInch;
                      var tCm = (tInch) * 2.54;
                      var tM = (tCm) / 100;
                      var bmi = iwt / (tM * tM);

                      var msg=" ";
                      if(bmi>25){
                      msg="You're Over Weight!!";
                      bgColor=Colors.red;
                      }else if(bmi<18){
                        msg="You're Under Weight!!";
                        bgColor=Colors.yellow;
                      }else{
                        msg="You're Healthy!!";
                        bgColor=Colors.green ;
                      }// Format BMI result
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    } else {
                      result = "Please fill all the required blanks!";
                    }
                    setState(() {});
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Button background color
                      foregroundColor: Colors.white, // Text color
                    ),
                  child: Text('Calculate'),
                ),
                SizedBox(height: 11),
                Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
