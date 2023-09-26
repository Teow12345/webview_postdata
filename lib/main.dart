// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:typed_data'; // Import for Uint8List
import 'dart:convert'; // Import for utf8.encode

// Entry point of the Flutter app
void main() => runApp(MyApp());

// MyApp class extends StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(), // Set WebViewExample as the home screen
    );
  }
}

// WebViewExample class extends StatefulWidget
class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

// _WebViewExampleState class extends State<WebViewExample>
class _WebViewExampleState extends State<WebViewExample> {
  InAppWebViewController? _webViewController; // Controller for WebView
  final String _url = "https://www.sql.com.my/income-tax-calculator-malaysia/ya-2022/"; // URL to load

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InAppWebView Example"), // Set the app bar title
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(_url), // Set the URL to load
          method: 'POST', // Set the HTTP method to POST
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded', // Specify the content type
            'User-Agent': 'insomnia/2023.5.8', // Set the user agent
            'Cookie': 'wordpress_google_apps_login=17fc1400c13b1f837d5b77f11ef6a2a0', // Add cookies if needed
          },
          body: Uint8List.fromList(utf8.encode(_getPostDataString())), // Encode and set POST data
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller; // Save the controller for later use
        },
      ),
    );
  }

  // Function to construct the POST data as a query string
  String _getPostDataString() {
    Map<String, String> postData = {
      'grossIncome': '66000',
      'lossOfEmployment': '1',
      'serviceYear': '4',
      'grossIncome': '66000',
      'lossOfEmployment': '1',
      'serviceYear': '4',
      'lossOfEmployment': '1',
      'serviceYear': '4',
      'compensation': '0',
      'disabled': '1',
      'maritalStatus': '1',
      'disabledSpouse': '1',
      'workingSpouse': '1',
      'alimony': '1000',
      'child': '1',
      'childBelow18': '1',
      'childALevel': '2',
      'childHigherEdu': '3',
      'childDisabled': '4',
      'childDisabledHigherEdu': '5',
      'childEdu': '6',
      'breastfeeding': '7',
      'childcare': '8',
      'parentMedical': '9',
      'prs': '10',
      'medicalInsurance': '11',
      'eduSelf': '12',
      'supportEquip': '13',
      'medical': '14',
      'epf': '15',
      'lifeInsurance': '16',
      'lifestyle1': '17',
      'lifestyle2': '18',
      'lifestyle3': '19',
      'socso': '20',
      'travel':  '21',
      'ev': '22',
      'pcb': '23',
      'zakat': '24',
      'btnCalcTax': '1',


    };


    // Convert the POST data to a query string
    return postData.entries.map((entry) {
      return "${entry.key}=${entry.value}";
    }).join('&');
  }
}