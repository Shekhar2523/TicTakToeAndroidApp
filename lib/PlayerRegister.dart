import 'package:flutter/material.dart';

class PlayerRegister extends StatefulWidget {
  @override
  _PlayerRegisterState createState() => _PlayerRegisterState();
}

class _PlayerRegisterState extends State<PlayerRegister> {

  TextEditingController player1TextEditingController = new TextEditingController();
  TextEditingController player2TextEditingController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (val) {return val.isEmpty?"Naam Batao":null; },
                controller: player1TextEditingController,
                decoration: InputDecoration(
                  hintText: "Player 1 Name",
                  hintStyle: TextStyle(
                    color: Colors.amberAccent,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) {return val.isEmpty?"Naam Batao":null; },
                controller: player2TextEditingController,
                decoration: InputDecoration(
                  hintText: "Player 2 Name",
                  hintStyle: TextStyle(
                    color: Colors.amberAccent,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text("Submit"),
                onPressed: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
