import 'package:flutter/material.dart';
import 'package:world_time/services/would_time.dart';


class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
      WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
      WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
      WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'argentina.png'),
      WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
      WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
      WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
     
    
      
      // Add more locations as needed
    ]; 

    void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      // Navigate back to home screen with updated time
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDayTime,
      });
    }
  @override
  Widget build(BuildContext context) {

    
   
    return Scaffold(
  backgroundColor: Colors.grey[200],
  appBar: AppBar(
    backgroundColor: Colors.blue[900],
    title: Text('Choose Location'),
    elevation: 0,
  ),
  body: SafeArea(
    child: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal:4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
                // Add logic here to handle tap, e.g. update time
              },
              title: Text(locations[index].location),
              leading: CircleAvatar( 
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
      },
      physics: AlwaysScrollableScrollPhysics(),
    
    ),
  ),
);

  }}