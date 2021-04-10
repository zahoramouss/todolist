class Todolist{
  int id;
  String name;
  String email;
  String password;
  String content;

  Todolist(this.id, this.name,this.email,this.password);

 Todolist.fromJson(Map<String, dynamic> json) {

 this.id= json['id'];
  this.name= json['name'];
  this.email= json['email'];
  this.password= json['password'];
   this.content=json['content'];

  }
}



