import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class API{

  Future<String> get file_directory async{
    var dir = await getExternalStorageDirectory();
    return dir.path;
  }

  Future<File> apifile(String name) async{
    final path = await file_directory;
    return File("$path/$name.txt");
  }

  writefile(String name) async{
    try{
      final file = await apifile("keyfile");
      String tojson = jsonEncode(name);
      print("tojson: $tojson");
      await file.writeAsString(tojson);
    }catch(e){
      print("errorwritting: #e");
    }
  }

  Future<String> readfile() async {
    try {
      final file = await apifile("keyfile");
      String fromjson;
      await file.readAsString().then((value) => fromjson = value);
      print("fromjson: $fromjson");
      String datastored = jsonDecode(fromjson);
      print("final string: $datastored");
      return datastored;
    } catch (e) {
      List<Map<dynamic, dynamic>> helo = List();
      print("error: $e");
      return "";
    }
  }
}