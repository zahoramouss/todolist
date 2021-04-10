import 'dart:async';
import 'dart:convert';
import'package:http/http.dart' as http;
import'../model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class userTask{
  var h;bool status;
  String msg;
  bool onstatus=false;
bool comstaus=false;
bool tstatus=false;
String url='https://damp-hamlet-68550.herokuapp.com/api';
var token;
  loginData(String email, String password) async {
    String myUrl = "$url/login";
    status=false;
    try{

      http.Response response = await http.post(myUrl, headers: {
        'Accept': 'application/json',
      }, body: {
        "email": "$email",
        "password": "$password",
      });
      var data = json.decode(response.body);
      print(data);
      status=data["success"];
      if (status) {
        token=data["data"]["token"];
        print('data:${data["data"]["token"]}');
        await save(data["data"]["token"]);
        await saven(data["data"]["name"]);

      } else {
        msg='Please check  email or password';

      }

    }catch(e){

      msg ='please check your network';
    }
  }

  registerData(String name, String email, String password, String cpassword) async {
    String myUrl = "$url/register";
    try{

      http.Response response = await http.post(myUrl,
          headers: {
            'Accept': 'application/json',
          },
          body: {
            "name": "$name",
            "email": "$email",
            "password": "$password",
            "c_password": "$cpassword",
          });
      //tatus = response.body.contains('error');

      var data = json.decode(response.body);

      if (data["success"]){
        print(data["data"]["token"]);
        token=data["data"]["token"];
        msg="true";
        status=data["success"];
        await save(token);
        await saven(data["data"]["name"]);
        read();}
      else{
        msg='Please check  email or password';
      }
    }catch(e){

      msg ='please check your network';

    }
  }

  save(String token) async {
    final value = token;
    final pret = await SharedPreferences.getInstance();
    final key = 'tokenn';
    pret.setString(key, value);
  }
  saven(String name) async {
    final value = name;
    final pret = await SharedPreferences.getInstance();
    final key = 'name';
    pret.setString(key, value);
  }








//create today task
 Future<Todolist>createTotask(String content)async{
String myurl='$url/createTodayTask';
Todolist p;
token=await read();

try{
  http.Response res = await http.post(myurl,
      headers: {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token'
      },
      body: {
        "content":"$content"
      }
      );
  var data=jsonDecode(res.body);
  print(data);
  var list=data["data"];
  var l=data["success"];
  if (l){
    onstatus=true;
  }

  p=Todolist.fromJson(list);

}
catch(e){

}
return p;
}
//create tomorrow task
  Future<Todolist>createTomorrowtask(String content)async{
    String myurl='$url/createTomorrowTask';
    Todolist p;
    try{
      http.Response res = await http.post(myurl,
          headers: {
            "Accept": 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: {
            "content":"$content"
          }
      );
      var data=jsonDecode(res.body);
      var l=data["success"];
      if (l){
        tstatus=true;
      }
      p=Todolist.fromJson(data["data"]);

    }
    catch(e){
      print(e);
    }
    return p;
  }
//make atask complete
Future<List<Todolist>>showallTommorrowtask()async{
  token=await read();
  List<Todolist> tlist=List<Todolist>();
  String myurl='$url/showTomorrowTask';

  try{
    http.Response res=await http.get(myurl,
      headers: {
        "Accept": 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var data=jsonDecode(res.body);
    //if (data[ "success"])
    var u=data["data"];
    tstatus=data["success"];
    for (var i=0;i<u.length;i++){

      var v= Todolist.fromJson(u[i]);
            tlist.add(v);
      //print(tlist);
      // print(u[i]);
      //print(ongoingtast);
    }
  }

  catch(e){

  }
return tlist;
}
//show today task
Future<List<Todolist>> showTodaytask()async{
  token=await read();
  print(token);
  String myurl='$url/showTodayTaskOngoing';
  onstatus=false;
  List<Todolist> ongoingtast= List<Todolist>();

  try{
    http.Response res=await http.get(myurl,
      headers: {
        "Accept": "application/json",
        'Authorization':" Bearer $token",
      },
    );
    var data=jsonDecode(res.body);
    var u=data["data"];
    onstatus=data["success"];
    if (onstatus){
      var g=u.length;
    for (var i=0;i<g;i++){

      var v= Todolist.fromJson(u[i]);
     // print(v);
      ongoingtast.add(v);


    }}



  }
  catch(e){}
  return ongoingtast;
  // return ongoingtast;
}
//make task from ongoing complete
Future<Todolist>makeTaskcomplete(int id)async{
  token=await read();
  String myurl='$url/makeTaskCompletedOrOngoing/$id';
  var lis;
  try{

  http.Response res=await http.get(myurl,
    headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    },
  );
  var data=jsonDecode(res.body);
  lis=Todolist.fromJson(data["data"]);

}catch(e){
  print('ؤاثؤن ');
}
return lis;
}
//delete task
deleteTask(int id)async{
  String myurl='$url/delete/$id';
  try{
    http.Response res = await http.get(myurl,
      headers: {
        "Accept": "application/json",
        'Authorization':" Bearer $token",
      },
    );
  var data=jsonDecode(res.body);


  }
  catch(e){
  print('check your network');
  }
}
//show user info
Future<String>showUserinfo()async{
  token=await read();
  String myurl='$url/user';
  String name;
  try {
    http.Response res=await http.get(myurl,
      headers: {
        "Accept": 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var data=jsonDecode(res.body);
     name=data["name"];

  }catch(e){}
  return name;
  }

  //logout
  logout()async{
    token=await read();
    String myurl='$url/logout';
    try{
      http.Response response=await http.get(myurl,
        headers: {
          "Accept": "application/json",
          'Authorization':" Bearer $token",
        },
      );
      var data=jsonDecode(response.body);
    }catch(e){}
  }

  ////show completed task
Future<List<Todolist>> showCompletedtask()async{
  token=await read();
  String myurl='$url/showTaskCompleted';
  List<Todolist> ongoingtast= List<Todolist>();

  try{
    http.Response res=await http.get(myurl,
      headers: {
        "Accept": "application/json",
        'Authorization':" Bearer $token",
      },
    );
    var data=jsonDecode(res.body);
    var u=data["data"];

   comstaus=data["success"];
    print (data);
    if (comstaus){
    var g=u.length;
    for (var i=0;i<g;i++) {
      var v = Todolist.fromJson(u[i]);
     // print(v);
      ongoingtast.add(v);
    }
    }

  }
  catch(e){}
  return ongoingtast;
  // return ongoingtast;
}
Future<bool>  transfrmtask(int id)async{
  bool l;
  token=await read();
  String myurl='$url/transportTask/$id';
  try {
    http.Response res = await http.get(myurl,
      headers: {
        "Accept": "application/json",
        'Authorization': " Bearer $token",
      },
    );
    var data=json.decode(res.body);
    print(data);
  l=data["success"];
  print(onstatus);
  if (l){
    onstatus=true;
  }
  }catch(e){

  }return l;
}
///////
forgot(String email)async{
  bool l;
  //token=await read();
  String myurl='$url/forgot';
  try{
    http.Response res=await http.post(myurl,
        headers: {
        "Accept": "application/json",},
      body: {
      "email":"$email"
      }
      );
     var data=jsonDecode(res.body);

    msg=data["message"];
  }catch(e){
msg='please check your network';
  }
}
////reset passwoed
reset(String toke,String pass,String conpass)async{
  String myurl='$url/reset';
  print(toke);
  msg='';
  try{
    http.Response res=await http.post(myurl,
        headers: {
          "Accept": "application/json",},
        body: {
          "token":"$toke",
          "password":"$pass",
          "password_confirm":"$conpass",
        }
    );
    var data=jsonDecode(res.body);
    print(data);
    msg=data["message"];
    if (data["message"]){}else{
      msg='Verify your code';
    }
  }catch(e){

  }
}
  read() async {
    final pret = await SharedPreferences.getInstance();
    final key = 'tokenn';
    String value = pret.get(key)?? '';
    print('read : $value') ;
    return value;
  }

  Future<String>readn() async {
    final pret = await SharedPreferences.getInstance();
    final key = 'name';
    String value = pret.get(key)?? '';
    print('read : $value') ;
    return value;
  }
  }






