class userModel {
  String? id;
  String? email;
  String? phone;
  String? userName;

  userModel({this.email, this.id, this.phone, this.userName});
userModel.fromjson(Map <String,dynamic>json):this(
  id: json['id'],
  email: json['email'],
  phone: json['phone'],
  userName: json['userName'],
);
Map<String,dynamic>tojson(){
  return{
    "id":id,
    "email":email,
    "phone": phone,
    "userName": userName,

  };
}
}
