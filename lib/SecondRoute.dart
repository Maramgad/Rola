import 'package:flutter/material.dart';
import 'package:flutter_dev/FormScreen.dart';
import 'package:flutter_dev/data/locations%20.dart';
//import 'package:url_launcher/url_launcher.dart';
//mport 'package:url_launcher/url_launcher.dart';


import 'dart:async';

class SecondRoute extends StatelessWidget {
  int number;
  locations l;
  SecondRoute(this.number,this.l);
  @override
  //final locations l2 = new locations();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
            child:Column(
                mainAxisSize: MainAxisSize.min,
                children :<Widget> [
                  Text(l.listobj[number].name),

                  Image.network(l.listobj[number].imageUrl),
                  Text(l.listobj[number].description),



                ]
            )
        ),
        floatingActionButton: FloatingActionButton( onPressed:(){
          String url=l.listobj[number].locationUrl;
          //_launchURL(url);
        },


          child: const Icon(Icons.navigation),)

    );

  }
  // _launchURL(String url) async {

  //   //String url = l.listobj[number].locationUrl;

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}