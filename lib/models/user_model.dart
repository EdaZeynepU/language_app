import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_app/firebase/auth.dart';

class userModel{
  String name;
  String password;
  int points;
  List<dynamic> completedLevels=[];


  userModel(this.name,this.password,this.points,this.completedLevels);

  get state => this.name;

  set setName(String name){
    this.name=name;// !!!!!!daha önceden böyle bir isim var mı zaten tanımlı mı!!!!!!!
  }
  set setPassword(String password){
    this.password=password;//!!!!!!!!!kriterlere uygun mu!!!!!!!!!
  }
  set setCompletedLevels(List<String> lst){
    this.completedLevels=lst;
  }

  set setPoints(int i){
    this.points=i;
  }

  String get getName =>name;
  List<dynamic> get getCompletedLevels =>completedLevels;
}

Future<userModel> createModel() async{

  DocumentSnapshot<Object?> currentUser= await AuthService().getUser();

  return userModel(currentUser["name"],currentUser["password"],currentUser["points"],currentUser["completedLevels"]);

}

