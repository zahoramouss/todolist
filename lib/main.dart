import 'package:flutter/material.dart';
import 'screens/today.dart';
import 'screens/tomorrow.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/forgetpassword.dart';
import 'screens/creatpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
var pgHome;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =  await SharedPreferences.getInstance();
  if(  !(prefs.containsKey("tokenn"))||((prefs.getString("tokenn")==" ")||prefs.getString("tokenn")=="0")||prefs.getString("tokenn")==null){
  pgHome=Signin();
  }else{
    pgHome=new today();
  }
runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        home:pgHome,//  pgHome,
        debugShowCheckedModeBanner: false,

      routes: {
        '/home'  : (BuildContext context) => today(),
        '/tomorrow'       : (BuildContext context) =>tomorrowTask(),
        '/Signin': (BuildContext context) => Signin(),
        '/Signup': (BuildContext context) => Signup(),
        '/Create': (BuildContext context) => Create(),
        '/Forgetpassword': (BuildContext context) => Forgetpassword(),


      },
    );
  }
}

