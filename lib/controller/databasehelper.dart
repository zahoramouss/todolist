import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class DatabaseHelper {
  String serverurl ='https://damp-hamlet-68550.herokuapp.com/api';
//  var token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTdmNTMzYTBkYTMxNWUzNGU5MzYwNzg4ZmNkOTgzNTE2ZjBjMTAzOTM1MDA1YTM4MGIwNzcwYzc0MGIwNDgwNTlhNjRhMzNkZjc5Y2I4ODIiLCJpYXQiOiIxNjE0ODc4MzE4LjcyNDQxNyIsIm5iZiI6IjE2MTQ4NzgzMTguNzI0NDIzIiwiZXhwIjoiMTY0NjQxNDMxOC43MDkwNzIiLCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.Yh9uwlkmZK76mSiDwTrHJCvbB5uXe1Qf55ekl3VIUFhW9H3fTOWMcoJM1F6w977gDvC1Jh2xYcSXlk0-W97HhScYJ7o4iDTe1jMa6rNxK2BXve0LRTWet8yzPvTa_l7WFfnNsS-AwFvBTmMrrYRgEfyw0wfvkHA_mmNQz3sfTODdsR_m-eCYNE7-Zt3KpWcQ38cVzDKPTz-aZeMn5KEsNrA9UoaRWQXhmCGVA0chzo-wiU2cTLDoUbaCmdlN3LRvfLyAF_XmLpus7-Q0Gtjtxc1Blmm-mPJyNZbdalm1U2Sv-btwkNirw0jX9neCQDW4hKh77Ga9Rfskgt3YMRSm3rKncK6v8at2e3Lls1HodqBk_SezS-gv2HVrd2jJmqRiTPGm9HzzJqUJspp53w4vynm7cAHmYH22hTTA2Q3vMdUe98SopBk-5rrOI2ocIWAZT8W7vEtljx9vd-_drzn2N3GW9EJLmF0C_q3sGv86VOaKJ71i-5AQI4EqPTgb4IqZYBBVTguhfaRRj-1uFn1ba1-0VQRO0e77G5UdQPK3LQqWsVsLnwtOo9xVQMEZ1YzFj052BLpaTBXedwz9mrVUSmYYdU_LXq_ghu2h_5LT076X3TrndKoefm_pyt386mEVvGWSIBNs4pRFnhdkgRScBsfhZfqN6byWdlhK_6CIzf0';
  var status;
  String msg;

  var token;
  loginData(String email, String password) async {
    String myUrl = "$serverurl/login";
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
      print('data:${data["data"]["token"]}');
      await _save(data["data"]["token"]);
      read();
    } else {
      msg='hello';

    }

  }

  registerData(String name, String email, String password, String cpassword) async {
    String myUrl = "$serverurl/register";
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
      _save(token);
      read();}
      else{
        msg='check your email';
      }
    }catch(e){
      msg ='check your network';
    }
    }

  _save(String token) async {
    final value = token;
    final pret = await SharedPreferences.getInstance();
    final key = 'tokenn';
    pret.setString(key, value);
  }



}
read() async {
  final pret = await SharedPreferences.getInstance();
  final key = 'tokenn';
  String value = pret.get(key)?? '';
  print('read : $value') ;
  return value;
}


