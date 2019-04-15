import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/database/radio_data.dart';

class StationList extends StatelessWidget {
  final List<RadioStation> radioStation;
  StationList({Key key, this.radioStation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: radioStation == null ? 0 : radioStation.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: new Container(
                child: new Center(
                    child: new Column(
                      // Stretch the cards in horizontal axis
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          // Read the name field value and set it in the Text widget
                          radioStation[index].name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Image.network(
                          radioStation[index].url
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                          "Category:- " + radioStation[index].category,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                      ],
                    )),
                padding: const EdgeInsets.all(15.0),
              ),
            );
        });
  }
}