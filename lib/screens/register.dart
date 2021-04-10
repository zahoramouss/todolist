import '../controller/databasehelper.dart';
import 'package:flutter/material.dart';

import '../resources/resource.dart';
import '../widget/empty.dart';
class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupState();
  }
}

class SignupState extends State<Signup> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgstatus = '';
  bool _obscureText1=true;
  bool _obscureText2=true;
  final TextEditingController _namecontrolr = new TextEditingController();
  final TextEditingController _emailcontrolr = new TextEditingController();
  final TextEditingController _passwordcontrolr = new TextEditingController();
  final TextEditingController _conpasswordcontrolr = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: new SingleChildScrollView(child:
      Container(
       margin: EdgeInsets.only(top: size.height *.06),
        alignment: Alignment.center,
        child: new Column(
          children: [
           head(context,8),
            textField(context,_namecontrolr,"Name",3),
            textField(context,_emailcontrolr,"Email",3),

            Container(
              margin: EdgeInsets.only(top: size.height * .03),
              width: size.width * .70,
              child: new TextField(
                obscureText: _obscureText1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      },
                      child: Icon(
                        _obscureText1 ? Icons.visibility_off :  Icons.visibility,
                        semanticLabel:
                        _obscureText1 ? 'show password' : 'hide password',
                        color: purple,
                      ),
                    ),
                    hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bpurple),
                    ),
                    hintText: 'Password'),
                controller: _passwordcontrolr,
              ),
            ),
            Container(

              margin: EdgeInsets.only(top: size.height * .03),
              width: size.width * .70,
              child: new TextField(
                obscureText: _obscureText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      child: Icon(
                        _obscureText2 ? Icons.visibility_off :  Icons.visibility,
                        semanticLabel:
                        _obscureText2 ? 'show password' : 'hide password',
                        color: bpurple,
                      ),
                    ),
                    hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bpurple),
                    ),
                    hintText: 'Confirm Password'),
                controller: _conpasswordcontrolr,
              ),
            ),
        Container(
          margin: EdgeInsets.only(top: size.height * .04),
          height: size.height * .07,
          width: size.width * .70,
          child:RaisedButton(
            child: Text('Sign up', style: TextStyle(color: Colors.white,
              fontSize: ((size.width*.048)>20)?20:size.width*.048,)),
            color: bpurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          onPressed: (){

              if (_namecontrolr.text.trim().isNotEmpty && _emailcontrolr.text.trim().isNotEmpty && _passwordcontrolr.text.trim().isNotEmpty && _conpasswordcontrolr.text.trim().isNotEmpty) {
                if( _passwordcontrolr.text.trim()==_conpasswordcontrolr.text.trim() ){
                     databaseHelper.registerData(_namecontrolr.text.trim(), _emailcontrolr.text.trim().toLowerCase(), _passwordcontrolr.text.trim(), _conpasswordcontrolr.text.trim()).whenComplete(() {
                    if((databaseHelper.status)==true){
                      Navigator.of(context).pushNamed('/home');
                    }else{
                      print(databaseHelper.msg);
                      showdial(context, databaseHelper.msg);
                    }
                  });
                }else{
                  showdial(context, "Passwords do not mutch");

                }}else{
                showdial(context, "All fields are required");
              }

          },),),



            Container(
              margin: EdgeInsets.only(top: size.height * .04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('Already no account?',style: TextStyle(fontSize: ((size.width*038)>16)?16:(size.width*037),
                  color: listpurple),
                  ),
              new FlatButton
                (onPressed: ()=> {Navigator.of(context).pushNamedAndRemoveUntil('/Signin',(Route<dynamic>route)=>false)},
                  child: new Text('Sign in',style: TextStyle(color:fgreen,
                      decoration: TextDecoration.underline,
                      decorationColor: fgreen,
                  fontSize: ((size.width*038)>16)?16:(size.width*037)))
                  ),
                ],
              ),
            ),
          ], //children
        ), //culomn
      ),)//Container
    ); //scaffold
  }

}
