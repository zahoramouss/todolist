import 'package:flutter/material.dart';
import '../resources/resource.dart';
import 'package:intl/intl.dart';
Widget back(BuildContext context,String d,int y){
  var size=MediaQuery.of(context).size;
  final now=DateTime.now();
  return Stack(

    children: [

      Container(
        height: size.height*.46,
        width: size.width*1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background-2.jpg',),
              fit: BoxFit.fill
          ),
        ),
      ),
      //today date
      Container(
          margin: EdgeInsets.only(top: size.height*.16),
          // alignment: Alignment.bottomCenter,
          child: Center(child:Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$d',style: TextStyle(fontSize: 35,fontFamily: fbold,color: Colors.white,fontWeight: FontWeight.bold),),
              Text(
                  '${DateFormat('EEEEE', 'en_US').format(((DateTime(now.year,now.month,now.day+y))))}',style: TextStyle(fontSize: 26,fontFamily: fregular,color: Colors.white)),
              Text('${DateFormat('dd-MM-yyyy').format(((DateTime(now.year,now.month,now.day+y))))}',textAlign: TextAlign.center,style: TextStyle(fontSize:18,  fontFamily: fregular,color: Colors.white))
            ],
          ))),
    ],
  );


}