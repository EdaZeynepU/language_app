import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getUser() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String currentUserName = prefs.getString("currentUser") ?? "eda";
  List<String>? lst=prefs.getStringList(currentUserName);

  return lst ?? ["name:isim","password:1234"];
}


class userModel{
  String name;
  late String password;
  List<String> completedLevels=[];

  userModel(this.name);

  void set setName(String name){
    this.name=name;// !!!!!!daha önceden böyle bir isim var mı zaten tanımlı mı!!!!!!!
  }
  void set setPassword(String password){
    this.password=password;//!!!!!!!!!kriterlere uygun mu!!!!!!!!!
  }
  void set setCompletedLevels(List<String> lst){
    this.completedLevels=lst;
  }
  String get getName =>name;
  List<String> get getCompletedLevels =>completedLevels;

}

Future<void> createModel(userModel user) async{

  List<String> currentUser= await getUser();
  currentUser.forEach((element) {
    print("heyyyyy");
    List<String> temp = element.split(":");
    if (temp[0] == "completedLevels") {
      List<String> templst = temp[1].split(",");
      user.setCompletedLevels = templst;
    } else if (temp[0] == "password") {
      user.setPassword = temp[1];
    }
  });

}
