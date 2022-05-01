import 'package:flutter/material.dart';
import 'package:music_lyrics/appBar.dart';
import 'package:music_lyrics/body.dart';

import 'validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String song_name = '';
  String artist_name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              songField(),
              artistField(),
              Container(
                margin: EdgeInsets.only(bottom: 25.0),
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget songField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Song Name',
        hintText: 'Song Name here....',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        song_name = value!;
      },
    );
  }

  Widget artistField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Artist Name',
        hintText: 'Artist Name here ... ',
      ),
      keyboardType: TextInputType.text,
      onSaved: (value) {
        artist_name = value!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          //print('email $song_name and pass $artist_name');

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Body(song_name, artist_name),
          ));
        }
      },
      child: Text('submit'),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
    );
  }
}
