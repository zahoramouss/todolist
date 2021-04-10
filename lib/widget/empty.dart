import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/resource.dart';

Widget emptypic(BuildContext context){
var size=MediaQuery.of(context).size;
  return Center(child:Container(
    height: size.height*.128,
    width: size.width*.369,

       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/empty.png'))),));

}
Widget circle(BuildContext context){
  Center(child:   Theme(data: Theme.of(context).copyWith(accentColor:purple),
    child:CircularProgressIndicator() ,));


}
Widget head(BuildContext context,double g){
  var size=MediaQuery.of(context).size;
  return  Container(

    height: size.height*.14,
    margin: EdgeInsets.only(top: size.height *(g/100)),
    child: Image.asset('assets/images/ic-18.png'),
  );
}
Widget textField(BuildContext context,TextEditingController _namecontrolr,String txt,double margin){
  var size=MediaQuery.of(context).size;
return Container(
  margin: EdgeInsets.only(top: size.height * (margin/100)),
  width: size.width * .70,
  child: new TextField(
    keyboardType: TextInputType.emailAddress,

    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 19),
        hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bpurple),
        ),
        hintText: '$txt'),
    controller: _namecontrolr,

  ),
);

}


Widget showdial( BuildContext context,String mess){

  showDialog(context:context,builder: (BuildContext context,){
  var size=MediaQuery.of(context).size;
    return  AlertDialog(backgroundColor:Color(0xfff8f9ff),content:SingleChildScrollView(
        child:StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {

              return GestureDetector(
                child: Container(
                  width: size.width *.8357,
                  height: size.height *.18,
                  color: Color(0xfff8f9ff),


                  child: Center(
                    child:Text('$mess',style: TextStyle( color: bpurple,fontSize: 18,fontFamily: mr),),
                  )



                ),
                    onTap: (){
                      Navigator.pop(context);
                    }
              );
            })));}
  );}