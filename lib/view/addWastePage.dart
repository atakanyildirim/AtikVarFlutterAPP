import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grpcmobil/controller/wasteController.dart';
import 'package:toast/toast.dart';

class AddWastePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddWastePageState();
}

class AddWastePageState extends State<AddWastePage> {
  String dropdownValueAtik = 'Atık Pil';
  String dropdownValueMiktar = 'Adet';
  TextEditingController wasteAmountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Atık Ekle", style: GoogleFonts.lilitaOne(fontSize: 25)),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Atık Cinsi : ",
                        style: GoogleFonts.francoisOne(
                            color: Colors.green, fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueAtik,
                        items: <String>[
                          'Atık Pil',
                          'Kağıt Atık',
                          'Plastik Atık',
                          'Cam Atık'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: GoogleFonts.francoisOne(
                                  color: Colors.black54, fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            dropdownValueAtik = selected;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.francoisOne(
                        color: Colors.green, fontSize: 16),
                    controller: wasteAmountController,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Miktar',
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Miktar Türü : ",
                          style: GoogleFonts.francoisOne(
                              color: Colors.green, fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: dropdownValueMiktar,
                          items: <String>['Adet', 'Gr', 'Kg', 'Ton']
                              .map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(
                                value,
                                style: GoogleFonts.francoisOne(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (selected) {
                            setState(() {
                              dropdownValueMiktar = selected;
                            });
                          },
                        ),
                      ],
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('Atık Ekle'),
                        onPressed: () async {
                          try {
                            bool isAdded = await WasteController.addWaste(
                                dropdownValueAtik,
                                int.parse(wasteAmountController.text),
                                dropdownValueMiktar);
                            if (isAdded) {
                              Toast.show("Başarıyla Eklendi", context,
                                  duration: 5,
                                  gravity: Toast.TOP,
                                  backgroundColor: Colors.lightGreen);
                              Navigator.pop(context);
                            } else {
                              Toast.show("Eklenirken Bir Hata Oluştu", context,
                                  duration: 3,
                                  gravity: Toast.TOP,
                                  backgroundColor: Colors.red);
                            }
                          } catch (error) {
                            print(error.toString());
                            Toast.show("Hata Oluştu", context,
                                duration: 3,
                                gravity: Toast.TOP,
                                backgroundColor: Colors.red);
                          }
                        })),
              ],
            )));
  }
}
