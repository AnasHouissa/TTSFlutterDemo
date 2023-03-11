import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech_demo/tts.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  TextToSpeech.initTTS();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("TTS")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (text.isNotEmpty) {
                    TextToSpeech.speak(text);
                  }
                },
                child: const Text("Speak"))
          ]),
        ),
      ),
    );
  }
}
