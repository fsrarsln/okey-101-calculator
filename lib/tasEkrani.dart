import 'package:flutter/material.dart';
import 'main.dart';

class TasEkrani extends StatefulWidget {
  const TasEkrani({
    Key? key,
  }) : super(key: key);

  @override
  State<TasEkrani> createState() => TasEkraniState();
}

class TasEkraniState extends State<TasEkrani> {
  static List secilenTasList = [];
  static double sum = 0;
  String text = '';

  void tasTopla() {
    setState(() {
      TasEkraniState.sum =
          TasEkraniState.secilenTasList.fold(0, (a, b) => a + b);
      if(TasEkraniState.sum > 101)
        {
          MyAppState.renk = Colors.green;
          text = 'EL AÇAR';
        }
      else
        {
          MyAppState.renk = Colors.red;
          text = 'el açmaz';
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Taşlar
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
              child: Center(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var i = 1; i < 14; i++)
                      SizedBox(
                        width: 50,
                        height: 80,
                        child: Ink(
                          color: const Color.fromRGBO(241, 226, 182, 1.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                TasEkraniState.secilenTasList.add(i);
                                //print(TasEkraniState.secilenTasList);
                                tasTopla();
                              });
                            },
                            splashColor: Colors.black,
                            child: Container(
                              width: 40,
                              height: 70,
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                '$i\n.',
                                style: const TextStyle(
                                  fontSize: 36,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 0.6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //Seçilen Taşlar
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
              child: Center(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var j = 0;
                        j < TasEkraniState.secilenTasList.length;
                        j++)
                      SizedBox(
                        width: 50,
                        height: 80,
                        child: Ink(
                          color: const Color.fromRGBO(241, 226, 182, 1.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                TasEkraniState.secilenTasList.removeAt(j);
                                tasTopla();
                              });
                            },
                            splashColor: Colors.black,
                            child: Container(
                              width: 40,
                              height: 70,
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                '${TasEkraniState.secilenTasList[j]}\n.',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: MyAppState.renk,
                                  fontWeight: FontWeight.bold,
                                  height: 0.6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //toplam
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    if (sum != 0)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$sum',
                            style: TextStyle(
                              color: MyAppState.renk,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            '$text',
                            style: TextStyle(
                              color: MyAppState.renk,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),

                          //Sıfırla butonu
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  TasEkraniState.secilenTasList.clear();
                                  TasEkraniState.sum = 0;
                                });
                              },
                              child: const Text('Sıfırla')),
                        ],
                      )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
