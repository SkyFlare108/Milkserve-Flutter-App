import 'package:milkserve2021ia/models/feedback_Form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TheController{

  final void Function(String) callback;

  static const String URL = "https://script.google.com/macros/s/AKfycbzEykVHOnP6wVNiGJg6EnZb15h8MEIB3aUNCGGeB22sfoI89WsesOg6v3IQbN1wxzCO/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  TheController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try{
      await http.get(
        URL + feedbackForm.toParams()
      ).then((response){
        callback(convert.jsonDecode(response.body)['status']);
      });
    }catch(e){
      print(e);
    }
  }
}