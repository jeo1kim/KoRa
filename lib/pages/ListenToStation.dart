
import 'package:flutter/material.dart';
import 'package:musicplayer/database/radio_data.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class ListenToStation extends StatefulWidget {

  int mode;
  List<RadioStation> stations;
  int index;

  ListenToStation(this.mode, this.stations, this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _tuneInto();
  }

}

class _tuneInto extends State<ListenToStation>
  with SingleTickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}