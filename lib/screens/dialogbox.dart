import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/resource.dart';
import 'package:flutter_switch/flutter_switch.dart';
class diag extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return diagstate();
  }

}
class diagstate extends State<diag>{
  @override
  TextEditingController tcont=TextEditingController();
  bool status=false;
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
   return Scaffold(
     body: Container(

       child: RaisedButton(
           child: Text('press'),
           onPressed: (){
             _showdialog(tcont,size);
           }),
     ),
   );
  }

  _showdialog(TextEditingController txt,var size){
    showDialog(context:context,builder: (BuildContext context,) {
      return new AlertDialog(content: StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return new Container(
            width: size.width * .83,
            height: size.height * .42,
            //color: Colors.white70,

            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * .05),

                    width: size.width * .66,
                    child: TextField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: bpurple),),
                            fillColor: bpurple,
                            hintText: 'tap something',
                            hintStyle: TextStyle(color: bpurple)),
                        controller: tcont),),
                  Container(
                      margin: EdgeInsets.only(top: size.height * .05),
                      // color: Colors.blue,
                      alignment: Alignment.center,
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //today
                          Text('Today', style: TextStyle(color: chint),),
                          ////switch
                          Container(
                            margin: EdgeInsets.only(right: 10, left: 10),
                            child: FlutterSwitch(
                              activeColor: bpurple,
                              inactiveColor: purple,
                              width: 39.0,
                              height: 19.0,
                              valueFontSize: 25.0,
                              toggleSize: 15.0,
                              value: status,
                              borderRadius: 30.0,
                              padding: 2.0,
                              showOnOff: false,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                              },
                            ),),
                          //ttomorrow
                          Text('Tomorrow', style: TextStyle(color: chint),),

                        ],),)),
                  Container(
                    margin: EdgeInsets.only(top: size.height * .15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * .29,
                          height: size.height * .05,
                         // margin: EdgeInsets.only(right: size.width * .04),
                          child: RaisedButton(
                            child: Text('Confirm'),
                            color: bpurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),

                            ),
                            onPressed: () => Navigator.pop(context),
                          ),),
                       Container(
                         //width:10,height: 10,
                       margin: EdgeInsets.only(left:2,right: 0),),
                        Container(
                            margin: EdgeInsets.only(right: size.width * .06),
                            width: size.width * .29,
                            height: size.height * .05,
                            child: RaisedButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: bpurple),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      }));
    });}
  }

