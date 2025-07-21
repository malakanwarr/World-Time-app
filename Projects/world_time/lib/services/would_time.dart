import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the ui
  late String time; //the time in that location 
  String flag; //url to asser flag icon 
  String url; //location url for api endpoint
  late bool isDayTime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final apiUrl = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url');
      http.Response response = await http.get(apiUrl);

      Map data = jsonDecode(response.body);
      DateTime now = DateTime.parse(data['dateTime']);

      isDayTime = now.hour> 6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(DateTime.parse(data['dateTime'])); // ✅ fixed
     

    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }




}
