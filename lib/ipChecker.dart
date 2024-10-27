
import 'dart:convert';
import 'package:fiber/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class Ipchecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IP Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IPCheckerScreen(),
    );
  }
}

class IPCheckerScreen extends StatefulWidget {
  @override
  _IPCheckerScreenState createState() => _IPCheckerScreenState();
}

class _IPCheckerScreenState extends State<IPCheckerScreen> {
  String _result = '';
  String _ipAddress = '';

  @override
  void initState() {
    super.initState();
    _fetchPublicIP();
  }

  Future<void> _fetchPublicIP() async {
    final response = await http.get(Uri.parse('https://api.myip.com'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _ipAddress = data['ip'];
      });
      getCountryByIP(_ipAddress);
    } else {
      setState(() {
        _result = 'Failed to fetch IP address.';
      });
    }
  }

  Future<void> getCountryByIP(String ip) async {
    const apiKey = '1e1f1909280f49328b051e2a46101b07';
    final response = await http.get(Uri.parse('https://api.ipgeolocation.io/ipgeo?apiKey=$apiKey&ip=$ip'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String countryCode = data['country_code2']; // Get the country code

      setState(() {
        _result = countryCode == 'IQ' ? 'The IP address is from Iraq.' : 'This page for Products';
      });
    } else {
      setState(() {
        _result = 'Failed to load country data.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your IP Address: $_ipAddress',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
