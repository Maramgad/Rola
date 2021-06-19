import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dev/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/FormScreen.dart';
import 'package:flutter_dev/SecondRoute.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dev/data/locations .dart';
import 'package:flutter_dev/models/location.dart';
import 'dart:async';
//import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// class MyApp extends StatefulWidget {
//   _MyAppState createState() => _MyAppState();
// }


// class _MyAppState extends State<MyApp> {
//   // Set default `_initialized` and `_error` state to false
//   bool _initialized = false;
//   bool _error = false;

//   // Define an async function to initialize FlutterFire
//   void initializeFlutterFire() async {
//     try {
//       // Wait for Firebase to initialize and set `_initialized` state to true
//      // await Firebase.initializeApp();
//       setState(() {
//         _initialized = true;
//       });
//     } catch(e) {
//       // Set `_error` state to true if Firebase initialization fails
//       setState(() {
//         _error = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     initializeFlutterFire();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show error message if initialization failed
//     if(_error) {
//       print("something went wrong");
//       //return SomethingWentWrong();
//     }

//     // Show a loader until FlutterFire is initialized
//     if (!_initialized) {
//       print("loading");
//       // return Loading();
//     }

//     return MyHomePage();
//   }
// }

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  _MyHomePageState createState() => _MyHomePageState();


}
class _MyHomePageState extends State<MyHomePage>{
  bool _initialized = false;
  bool _error = false;
  final locations l = new locations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Favorite locations'),
      ),

      body: Center(
        child: ListView.builder(
          itemCount: l.listobj.length,
          itemBuilder: (context, index){
            int number =index;
            return GestureDetector(
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondRoute(number,l)),);},
              child: Card(
                  child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children :<Widget> [
                        Image.network(l.listobj[index].imageUrl),
                        Text(l.listobj[index].name),
                        Text(l.listobj[index].theme),


                      ]
                  )
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        onPressed:()  {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomForm(l)));
        },


      ),
      
    );
  }

}



// ignore: must_be_immutable













