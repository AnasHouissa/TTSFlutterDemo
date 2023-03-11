import 'dart:ffi';

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() async {
    /*[ko-KR, ru-RU, zh-TW, hu-HU, th-TH,
    nb-NO, da-DK, tr-TR, et-EE, bs, sw, pt-PT,
     vi-VN, en-US, sv-SE, su-ID, bn-BD, el-GR, 
     hi-IN, fi-FI, km-KH, bn-IN, fr-FR, uk-UA, en-AU,
      nl-NL, fr-CA, sr, pt-BR, si-LK, de-DE, ku, cs-CZ, 
      pl-PL, sk-SK, fil-PH, it-IT, ne-NP, hr, zh-CN, es-ES,
      cy, ja-JP, sq, yue-HK, en-IN, es-US, jv-ID, la, id-ID, ro-RO,
       ca, ta, en-GB]*/
    tts.setLanguage("hi-IN");
    tts.setPitch(1.3);
    tts.setSpeechRate(0.4);
  }

  static speak(String text) async {
    tts.setStartHandler(() {
      print("start moving avatar");
    });

    tts.setCompletionHandler(() {
      print("stop moving avatar");
    });
    await tts.awaitSynthCompletion(true);

    tts.speak(text);
  }
}
