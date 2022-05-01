import 'package:flutter/material.dart';
import 'package:music_lyrics/appBar.dart';

import 'loadingScreen.dart';
import 'networking.dart';
import 'search/login_screen.dart';

class Body extends StatefulWidget {
  String name;
  String artistName;

  Body(this.name, this.artistName, {Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Map<String, dynamic> test;

  dynamic jsonData;
  dynamic realData;
  bool isLoading = true;

  Future test1() async {
    Networking networking = Networking(
        songNameNetwork: widget.name, artistNameNetwork: widget.artistName);

    await networking.getLyrics();

    jsonData = networking.hello();

    setState(() {
      if (jsonData == 'none') {
        realData = 'no data found';
        isLoading = false;
      } else {
        realData = jsonData['lyrics'];
        isLoading = false;
      }
    });

    //print(realData);
  }

  LoginScreen loginScreen = LoginScreen();

  @override
  void initState() {
    test1();
    //print(data);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LodingScreen()
        : Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: Text(realData.toString())),
              ),
            ));
  }
}
