import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'creatpassword.dart';
import '../resources/resource.dart';
import '../controller/userController.dart';

class Forgetpassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetpasswordState();
  }
}

class ForgetpasswordState extends State<Forgetpassword> {
  final TextEditingController emailcontrolr = new TextEditingController();
  final TextEditingController _code = new TextEditingController();
  userTask db=userTask();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/Signin',(Route<dynamic>route)=>false);

            },
            icon:Icon(Icons.arrow_back_outlined,color: purple,),
          ),
        ),
        extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
      child:Container(
        alignment: Alignment.center,
        child: new Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * .125),
              child: new Text(
                'Forgot your password?',
                style: TextStyle(color: purple,fontFamily:fbold,fontSize:  22,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:size.height*.02),
              child: new Text(
                'Enter your registered email bellow',
                style: TextStyle(color: tgrey,fontSize: 14),
              ),
            ),
            Container(

              child: new Text(
                'to receivce password reset instruction.',
                style: TextStyle(color: tgrey,fontSize: 14),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*.067),
              height: size.height*.19,
              width: size.width*.50,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('assets/images/ic-3.png'),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .06),
              width: size.width * .68,
              child: new TextField(

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: lpurple,fontFamily: fregular),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bpurple),
                      ),
                      hintText: 'Enter your Email'),
                  controller: emailcontrolr),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .06),
              height: size.height * .07,
              width: size.width * .71,
              child: RaisedButton(
                child: Text(
                  'Send',
                  style: TextStyle(color: Color(0xffeff5fa),fontSize:((size.width*.048)>20)?20:size.width*.048,),
                ),
                color: bpurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async{

                  await db.forgot(emailcontrolr.text.trim().toLowerCase());
                  if((db.msg)=="check your email"){
                  _showdialog(_code,size);}
                  //Navigator.of(context).pushNamed('/Create');
                },
              ),
            ),
          ],
        ),
      ),
      ));
  }
 Widget _showdialog(TextEditingController txt,var size){

    showDialog(context:context,builder: (BuildContext context,) {
      return  AlertDialog(backgroundColor:Color(0xfff8f9ff),content:SingleChildScrollView(
         child:StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {

            return new Container(
                width: size.width *.8357,
                height: size.height *.54,
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
                              new Text('please check your email and enter ',style: TextStyle(
                                color: Color(0xff4a3fd8),
                                fontFamily: mr,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              ),),
                              new Text('the received code bellow',
                                style: TextStyle(
                                    color: Color(0xff4a3fd8),
                                    fontFamily: mr,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),

                            ],),),
                      Container(
                        margin: EdgeInsets.only(top: size.height*.0241),
                        height: size.height*.1534,
                        width: size.width*.39,
                       // margin:EdgeInsets.only(top: size.height*.05),
                        child:Image.asset('assets/images/ic-4.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * .0351),
                        width: size.width * .32,
                       // height: size.height*.05,
                        child: TextField(
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top:20.0),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff5b4fff)),),
                                fillColor: bpurple,
                                hintText: 'code',
                                hintStyle: TextStyle(color: Color(0xffa39ded))),
                            controller: _code),),

                      Container(
                        margin: EdgeInsets.only(top: size.height * .0580),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width * .29,
                              height: size.height * .05,
                              // margin: EdgeInsets.only(right: size.width * .04),
                              child: RaisedButton(
                                child: Text('Confirm',style: TextStyle(
                                  color:Colors.white ,
                                ),),
                                color: Color(0xff5b4fff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                onPressed: () {
                                 setState((){
                                   tok=_code.text;
                                   print (tok);
                                 });
                                Navigator.of(context).pushNamed('/Create');}
                              ),),
                            Container(
                              width: size.width*.06,
                            ),

                            Container(
                                //margin: EdgeInsets.only(right: size.width * .06),
                                width: size.width * .29,
                                height: size.height * .05,
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Color(0xff5b4fff)),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel',style: TextStyle(color: Color(0xff5b4fff)),),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
          })));
    });}
}
