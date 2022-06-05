import 'package:flutter/material.dart';
import 'package:milkserve2021ia/controller.dart';
import 'dart:core';

import 'package:milkserve2021ia/models/feedback_Form.dart';


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status>{
  final _fKey = GlobalKey<FormState>();
  final _sKey = GlobalKey<ScaffoldState>();

  TextEditingController nameoController = TextEditingController();
  TextEditingController givenController = TextEditingController();
  TextEditingController dateeController = TextEditingController();

  void _submitForm(){
    if(_fKey.currentState.validate()){
      FeedbackForm feedbackForm = FeedbackForm(
        nameoController.text,
        givenController.text,
        dateeController.text,
      );
      TheController theController = TheController(
          (String response){
            print(response);
            if(response == TheController.STATUS_SUCCESS){
              _displaySnackBar("Feedback Processed");
            }else{
              _displaySnackBar("ERROR");
            }
          }
      );
      _displaySnackBar("Submitting Feedback");
      theController.submitForm(feedbackForm);
    }
  }
  _displaySnackBar(String message){
    final snackbar = SnackBar(content: Text(message),);
    _sKey.currentState.showSnackBar(snackbar);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log Trade',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            )
        ),
        backgroundColor: Color.fromRGBO(232, 223, 232, 1),
      ),
      backgroundColor: Color.fromRGBO(232, 223, 232, 1),
      key: _sKey,
      body: Form(
        key: _fKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameoController,
                    validator: (value){
                      if(value.isEmpty){
                        return("Enter a Name");
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                    hintText: "Name"
                    ),
                    ),
            TextFormField(
              controller: givenController,
                    validator: (value){
                      if(value.isEmpty){
                        return("Enter the number of Bottles given");
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                    hintText: "Status"
                    ),
                    ),
            TextFormField(
              controller: dateeController,
                    validator: (value){
                      if(value.isEmpty){
                        return("Enter The date it was requested for");
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                    hintText: "Date Requested for"
                    ),
                    ),
            Expanded(child: Container(child: Image.network('https://helpdeskgeek.com/wp-content/pictures/2020/01/google-sheets.png',),)),
            RaisedButton(
              onPressed: (){
                _submitForm();
              },
            child: Text("Log"),
          )
        ]
      ),
    ),
    ),
    );
    }
}

