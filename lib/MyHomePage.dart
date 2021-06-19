import 'package:flutter/material.dart';
 import 'package:flutter_dev/FormScreen.dart';
 import 'package:flutter_dev/SecondRoute.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
 //import 'package:firebase_core/firebase_core.dart';

import 'data/locations .dart';
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