import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: new Text('Profile'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: (){
          Navigator.of(context).pushReplacementNamed('/Home');
        }),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text('Mohammadhasan Azadi' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.white),),
              new Text('96110033206008' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.white),)
            ],
          ),
        ),
      )
    );
  }
}
