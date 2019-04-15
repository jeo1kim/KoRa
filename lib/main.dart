import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:musicplayer/musichome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:musicplayer/database/radio_data.dart';
import 'package:musicplayer/database/list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _mainState();
  }
}

class _mainState extends State<MyApp> {
  var isLoading = true;
  ThemeData theme;
  @override
  void initState() {
    super.initState();
    getTheme();
    getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: isLoading ? lightTheme : theme,
      title: "Music player",
      debugShowCheckedModeBanner: false,
      home: isLoading ? new Container() : new MusicHome(),

    );
  }

  getChannels() {
//    String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
//    final jsonResult = json.decode(data);
    var build = new FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/country.json'),
        builder: (context, snapshot) {
          List<RadioStation> stations =
          parseJosn(snapshot.data.toString());
          return !stations.isEmpty
              ? new StationList(radioStation: stations)
              : new Center(child: new CircularProgressIndicator());
        });

  }

  List<RadioStation> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Radio>((json) => new RadioStation.fromJson(json)).toList();
  }

  getTheme() async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getInt("theme");
    print("theme=$val");
    if (val == null) {
      theme = lightTheme;
    } else if (val == 1) {
      theme = darktheme;
    } else {
      theme = lightTheme;
    }
    setState(() {
      isLoading = false;
    });
  }



  ThemeData darktheme = new ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.grey[800],
    fontFamily: 'Raleway',
    sliderTheme: new SliderThemeData(
      activeTrackColor: Colors.deepPurpleAccent[700],
      inactiveTrackColor: Colors.deepPurpleAccent[100],
      activeTickMarkColor: Colors.white70,
      inactiveTickMarkColor: Colors.black,
      overlayColor: Colors.black12,
      thumbColor: Colors.purple,
      trackHeight: 10,
      overlayShape: new RoundSliderOverlayShape(),
      tickMarkShape: new RoundSliderTickMarkShape(),
      trackShape: new RectangularSliderTrackShape(),
      valueIndicatorColor: Colors.deepPurpleAccent,
      thumbShape: new RoundSliderThumbShape(),
      disabledActiveTrackColor: Colors.red,
      disabledInactiveTickMarkColor: Colors.green,
      disabledInactiveTrackColor: Colors.grey,
      disabledActiveTickMarkColor: Colors.cyanAccent,
      disabledThumbColor: Colors.grey,
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(color: Colors.black87),
      showValueIndicator: ShowValueIndicator.always,
    ),
    dialogBackgroundColor: Colors.black,
  );
  ThemeData lightTheme = new ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Raleway',
    primaryColor: Colors.deepPurple,
    accentColor: Colors.deepPurpleAccent,
  );
}
