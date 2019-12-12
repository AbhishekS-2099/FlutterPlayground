// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';

void main() => runApp(MaterialApp(
  home: Page1(),
));
class Page1 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Animation"),),
      body: Center(
        child: RaisedButton(
          child: Text("Go"),
          onPressed: (){
            Navigator.of(context).push(_createRoute());
          },
        ) ,

      ),
    );
  }
}
Route _createRoute(){
  return PageRouteBuilder(
    pageBuilder: (context,animation,secondaryAnimation)=>Page2(),
      transitionsBuilder: (context, animation,secondaryAnimation,child){
        var begin = Offset(0.0,1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      }
  );
}
class Page2 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("You're now in Page 2"),
      ),
      body: Center(
        child: Text("Yay, Transition Success"),
      ),
    );
  }
}

