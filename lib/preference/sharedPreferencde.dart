import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferenceService{
static late final SharedPreferences prefs;

Future<void> init() async{
  prefs = await SharedPreferences.getInstance();
}saveString(String name){
  prefs.setString('data', name);
}
getString(){
  var name = prefs.getString('data');
  return name;
}
}