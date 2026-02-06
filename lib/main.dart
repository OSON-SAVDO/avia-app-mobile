import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(AviaApp());
}

class AviaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String welcomeText = "Боргирӣ...";
  String price = "0.00";
  String selectedCurrency = "TJS";
  String selectedLang = "tg";

  // Функсия барои гирифтани маълумот аз Backend
  Future<void> fetchData() async {
    final url = 'https://https://aviasels-tj1.onrender.com/api/config?lang=$selectedLang&curr=$selectedCurrency';
    
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          welcomeText = data['welcomeText'];
          // Ҳисоб кардани нархи намунавӣ (масалан $100)
          double rate = data['rates']['value'];
          price = (100 * rate).toStringAsFixed(2);
        });
      }
    } catch (e) {
      print("Хатогӣ: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Avia TJ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(welcomeText, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Нархи чипта: $price $selectedCurrency", style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            // Тугмаҳо барои иваз кардани асъор
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () { selectedCurrency = "TJS"; fetchData(); }, child: Text("TJS")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { selectedCurrency = "USD"; fetchData(); }, child: Text("USD")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { selectedCurrency = "RUB"; fetchData(); }, child: Text("RUB")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
