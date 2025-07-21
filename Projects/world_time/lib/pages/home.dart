import 'package:flutter/material.dart';


class Home extends StatefulWidget {
 

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  Map data ={}; 


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    print(data);
    

    

    //set background image based on isDayTime
    String bgImage = data['isDayTime'] ? 'daytie.jpg' : 'nightime.jpg';
    Color bgColor = data['isDayTime'] ? const Color.fromARGB(255, 104, 177, 199) : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor, 
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            ),
            color: bgColor
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column( 
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDaytime'],
                      };
                    });
                  } ,
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                    size: 30.0
                    ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20.0
                    ),
                  ),),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
            
                    )
            
                  ]),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ]
            ),
          ),
        )
      )
    );
  }
}