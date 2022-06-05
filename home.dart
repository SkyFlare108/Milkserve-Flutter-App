import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milkserve2021ia/status.dart';
import 'dart:convert' as convert;
import 'dart:core';
import 'models/feedback_Model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  //Summary:
  //home.dart handles the





  List<FeedbackModel> _feedbacks = List<FeedbackModel>();
  FeedbackModel myFeedback = new FeedbackModel();
  int feedbackCount = 0;
  Future<FeedbackModel> getFeedbackFromSheet() async{
    var info = await http.get("https://script.google.com/macros/s/AKfycbwLAxvMHCxgrbYi20fU8ep6YmLAfaIkCYvh-9RppzUye9PGSeq-6d0vQNfozWg8vDzf/exec");
    // var url = "https://script.google.com/macros/s/AKfycbwLAxvMHCxgrbYi20fU8ep6YmLAfaIkCYvh-9RppzUye9PGSeq-6d0vQNfozWg8vDzf/exec";
    // var info = await http.get(url);
    // var feedbacks = List<FeedbackModel>();
    // print (myFeedback.name);
    if (info.statusCode == 200){
      var feedbacksJson = convert.jsonDecode(info.body);
      myFeedback = FeedbackModel.fromJson(feedbacksJson);
      feedbackCount = myFeedback.name.length;
    }
    return myFeedback;
    // var info = List<FeedbackModel>();
    // var jsonFeedback = convert.jsonDecode(raw.body);
    // print (raw);
    // Map<String, dynamic> jsonFeedback = jsonDecode(raw.body);
    // print('this is json Feedback $jsonFeedback');
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));
    // jsonFeedback.forEach((element){
    //   print('$element');
    //   FeedbackModel feedbackModel = new FeedbackModel();
    //   feedbackModel.name = element['name'];
    //   feedbackModel.bottles = element['bottles'];
    //   feedbacks.add(feedbackModel);
    // });
    // print('${feedbacks[0]}');
    //   for(var feedbackJson in feedbacksJson){
    //     feedbacks.add(FeedbackModel.fromJson(feedbackJson));
    //     print('this is json Feedback ${feedbacks.length}');
    //   }
  }

  @override
  void initState(){
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFeedbackFromSheet().then((value){
      setState(() {
        // FeedbackModel myFeedback = value;
        // _feedbacks.addAll(value);
      });
    });
    return Scaffold(
        backgroundColor: Color.fromRGBO(207, 158, 204, 1),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Request Dashboard",
          style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        )
      ),
      ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.list_alt_sharp),
            backgroundColor: Colors.green,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Status()),
              );
            }
        ),
      body:
      // Container(
      //   child:
        ListView.builder(
          // itemCount: _feedbacks.length,
          itemBuilder: (content, index) {
            // return FeedBackTile(
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Column(
                children: <Widget>[
                  Text(
                      // _feedbacks[index].name,
                    myFeedback.name[index] == null?
                "n/a" : myFeedback.name[index].toString(),
                  // 'chill',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    // 'chill',
                  "Bottles Requested: " + myFeedback.bottles[index].toString(),
                  style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              ],
              ),
              // name: feedbacks[index].name,
              // bottles: feedbacks[index].bottles
              )
            );
            },
          itemCount: feedbackCount,
          // itemCount: 1,
        )
    );
    // );
  }
}
// class FeedBackTile extends StatelessWidget {
//   final String name;
//   final String bottles;
//
//   FeedBackTile({this.name, this.bottles, Column child});
//
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(children: [
//           Row(children: [
//             SizedBox(width: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Text(name, style: TextStyle(fontSize: 20.0,
//                 //   fontFamily: 'Raleway',
//                 //   fontWeight: FontWeight.w300,)),
//                 // Text('bottles wanted: $bottles', style: TextStyle(
//                 //   fontSize: 20.0,
//                 //   fontFamily: 'Raleway',
//                 //   fontWeight: FontWeight.w700,)),
//               ],
//             )
//           ])
//         ],)
//     );
//   }
// }

