import 'package:flutter/material.dart';
import 'package:world_time/services/would_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
 
 

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await instance.getTime();
    // Navigate to home screen after fetching time
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
    

  }
  

  @override
  void initState() {
    super.initState();
    setupWorldTime();

    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center( 
        child: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
        ),
      ));
  }
}