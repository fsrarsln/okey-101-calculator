import 'package:flutter/material.dart';
import 'package:okeyhesaplama/tasEkrani.dart';
import 'tasEkrani.dart';
import 'secilenTaslar.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
static MaterialColor renk = Colors.red;







  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '101 Taş Hesapla',
      theme: ThemeData(
        primarySwatch:Colors.indigo
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('101 Taş Hesapla'),
          ),
          body: const TasEkrani()
      ),
    );
  }
}


