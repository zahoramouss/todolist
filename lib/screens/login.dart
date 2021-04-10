import 'package:flutter/material.dart';
import '../controller/userController.dart';
import '../resources/resource.dart';
import '../widget/empty.dart';


class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  userTask db=userTask();

  final _emailcontrolr = TextEditingController();
  final _passwordcontrolr = TextEditingController();


 bool _obscureText1=true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //scafold
    return Scaffold(
        //containerpage
        body: new Container(
            alignment: Alignment.center,
          child: SingleChildScrollView(
           child: Column(
              children: [
            //image
            head(context,8.08),
            //Email
                textField(context,_emailcontrolr,"Email",8.8),

            //password
            Container(
              margin: EdgeInsets.only(top: size.height * .048),
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
                    contentPadding: EdgeInsets.only(top: 19),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bpurple),
                    ),
                    hintText: 'Password'),
                controller: _passwordcontrolr,
              ),
            ),
            //frogetpassword
            Container(
              width: size.width * .75,
                alignment: Alignment.centerLeft,
                  //color: Colors.lightGreenAccent,
              margin: EdgeInsets.only(top: size.height * .0251,

              ),

              child: new FlatButton
              (onPressed:()=>{ Navigator.of(context).pushNamedAndRemoveUntil('/Forgetpassword',(Route<dynamic>route)=>false)
              } ,

                  child: Text('Froget password?',style: TextStyle(color: bpurple),)),),

            //Bottum
            Container(
              height: size.height * .07,
              width: size.width * .70,
              child: RaisedButton(
                child: Text('Sign in',style: TextStyle(
                    fontSize: ((size.width*.048)>20)?20:size.width*.048,
                    color: Colors.white,
                    fontFamily: fregular),
                ),
                color: bpurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed:()async{
                  setState(() {
                 if (_emailcontrolr.text.trim().toLowerCase().isNotEmpty &&
                     _passwordcontrolr.text.trim().isNotEmpty) {
                    db.loginData(_emailcontrolr.text.trim().toLowerCase(),
                     _passwordcontrolr.text.trim()).whenComplete(() {
                       if (db.status) {

                        Navigator.of(context).pushNamedAndRemoveUntil('/home',(Route<dynamic>route)=>false);
                             } else {
                           showdial(context,db.msg);
                         }
                            });
                            }else{
                   showdial(context,"All field are required");
                 }
                                 });
                         }
              ),
            ),
            //row/text+flatBottum,
            Container(
              margin: EdgeInsets.only(top: size.height * .06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('No account yet?',style: TextStyle(fontSize: ((size.width*038)>16)?16:(size.width*038),
                      color: listpurple),),
                  new FlatButton
                  (child: new Text('sign up',style: TextStyle(color:fgreen,
                      decoration: TextDecoration.underline,
                      decorationColor: fgreen,
                      fontSize: ((size.width*038)>16)?16:(size.width*038))),onPressed: ()=> {Navigator.of(context).pushNamed('/Signup')}, ),
                ],
              ),
            ),

           Container(
             margin: EdgeInsets.only(top: size.height*.056),
             child: Text('BY TG Devlopers',style: TextStyle(color: Color(0xffa2aece),
             fontFamily: fregular,
               fontSize: 14
             ),),
           )
          ],
        ),
      ),
    ));
  }



}

