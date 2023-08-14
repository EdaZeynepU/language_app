import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_app/firebase/auth.dart';

class userModel{
  String name;
  String password;
  int points;
  List<dynamic> completedLevels=[];
  late String language;
  late String targetLanguage;


  userModel(this.name,this.password,this.points,this.completedLevels,this.language,this.targetLanguage);

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
  void setPoints(int i){
    this.points=i;
  }

  void setLanguage(String language) {
    this.language = language;
  }

  void setTargetLanguage(String targetLanguage) {
    this.targetLanguage = targetLanguage;
  }

  String get getName =>name;
  String get getLanguage =>language;
  String get getTargetLanguage =>targetLanguage;
  int get getPoints =>points;
  List<dynamic> get getCompletedLevels =>completedLevels;


  void addPoints(int i){
    this.points+=i;
  }

}

Future<userModel> createModel() async{
  DocumentSnapshot<Object?> currentUser= await AuthService().getUser();
  return userModel(currentUser["name"],currentUser["password"],currentUser["points"],currentUser["completedLevels"],"eng","eng");
}

