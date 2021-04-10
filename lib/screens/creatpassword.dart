import 'package:flutter/material.dart';
import '../resources/resource.dart';
import '../controller/userController.dart';
import 'package:flutter/services.dart';
import '../widget/empty.dart';
class Create extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateState();
  }
}
class CreateState extends State<Create>{

  final TextEditingController _passwordcontrolr = new TextEditingController();
  final TextEditingController _confirmpasswordcontrolr =new TextEditingController();
  userTask db=userTask();
  bool _obscureText=true;
  bool _obscureText1=true;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil('/Forgetpassword',(Route<dynamic>route)=>false);
          },
          icon:Icon(Icons.arrow_back_outlined,color: purple,),
        ),
      ),
      extendBodyBehindAppBar: true,
      body:SingleChildScrollView(
        child: new Container(
        alignment:Alignment.center,
        child:new Column(
          children:[
            Container(
                margin: EdgeInsets.only(top: size.height*.125),
                child:new Text('Create new password?',
                    style:TextStyle(color:purple,
                    fontFamily: mr,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))),

            Container(
              margin: EdgeInsets.only(top: size.height*.015),
                child:new Text('Enter your new password',
                    style:TextStyle(color:tgrey,
                    fontFamily: fregular,
                    fontSize: 14))),

            Container(
              margin: EdgeInsets.only(top:size.height*.04642),
              height: size.height*.1998,
            width: size.width*.5064,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ic-5.png'),
              )
            ),),
            Container(
              margin: EdgeInsets.only(top: size.height*.025),
              width: size.width*.68,
              child: new TextField(

                  obscureText: _obscureText,
                  keyboardType:TextInputType.multiline,
                  autofocus: false,
                  decoration:InputDecoration(

                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off :  Icons.visibility,
                        semanticLabel:
                        _obscureText ? 'show password' : 'hide password',
                        color: bpurple,
                      ),
                    ),

                      hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
                      enabledBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5b4fff)),),
                      hintText: 'Password') ,
                  controller:_passwordcontrolr),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*.025),
              width: size.width*.68,
              child: new TextField(
                  obscureText: _obscureText1,
                  enableInteractiveSelection: false,
                  keyboardType:TextInputType.multiline,
                  decoration:InputDecoration(
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
                          color: bpurple,
                        ),
                      ),
                      hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
                      enabledBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5b4fff)),
                      ),
                      hintText: 'Confirm Password') ,
                  controller:_confirmpasswordcontrolr),
            ),
            Container(
              height: size.height * .07,
              width: size.width * .70,
              margin: EdgeInsets.only(top: size.height*.060),

              child:  RaisedButton(
                child: Text('Reset Password',
                  style: TextStyle(color:Colors.white,
                      fontSize: ((size.width*.048)>20)?20:size.width*.048),
                ),
                color: bpurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed:()async {
                  if (_passwordcontrolr.text
                      .trim()
                      .isNotEmpty &&
                      _confirmpasswordcontrolr.text
                          .trim().isNotEmpty) {
                    if ((_passwordcontrolr.text.trim() )==(_confirmpasswordcontrolr.text.trim())) {
                      db.reset(tok, _passwordcontrolr.text.trim(), _confirmpasswordcontrolr.text.trim())
                          .whenComplete(() {
                        print(_passwordcontrolr.text);
                        print(_confirmpasswordcontrolr.text);
                            print(db.msg);
                        if ((db.msg) == "success") {
                          _showdialog(size);
                        }
                        else {
                          showdial(context, db.msg);
                        }
                      });
                    }
                    else {
                      showdial(context, 'Passwords do not mutch');
                    }
                  } else {
                    showdial(context, 'All field are required ');
                  }
                } ),),

          ],

        ),
      ),
      ));

  }
  Widget _showdialog( var size){

    showDialog(context:context,builder: (BuildContext context,) {
      return  AlertDialog(backgroundColor:Color(0xfff8f9ff),content:SingleChildScrollView(
          child:StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {

                return new Container(
                  width: size.width *.8357,
                  height: size.height *.3716,
                  color: Color(0xfff8f9ff),


                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * .07),
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          //Center Column contents vertically,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new Text('Your Password is successfully ',style: TextStyle(
                                color: Color(0xff4a3fd8),
                                fontFamily: mr,
                                //fontWeight: FontWeight.bold,
                                fontSize: ((size.width*.0483)>20)?20:(size.width*.047)
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                              new Text('changed,you now ',
                                style: TextStyle(
                                    color: Color(0xff4a3fd8),
                                    fontFamily: mr,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: ((size.width*.0483)>20)?20:(size.width*.047)
                                ),),
                             GestureDetector(
                               child: Text('Sign in',style: TextStyle(
                                 color:fgreen,
                                 decoration: TextDecoration.underline,
                                 decorationColor: fgreen
                               ),),
                               onTap: (){
                                 Navigator.of(context).pushNamed('/Signin');
                               },
                             )
                            ],),
                            Container(
                              margin: EdgeInsets.only(top:size.height*.0502),
                              height:size.width*.2147 ,
                              width:size.width*.2147 ,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/ic-6.png')
                                )
                              ),
                            ),

                          ],),),

                    ],
                  ),
                );
              })));
    });}

}
