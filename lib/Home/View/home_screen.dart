import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Colors.amber, // Change color to amber
        title: Text("Hello"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter, // Align text at the top
            padding: EdgeInsets.only(top: 50.0), // Add top padding
            child: Text(
              "Welcome to IntelliBot!",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ava4.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0), // Add padding to the image
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        "assets/ava4.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter, // Align button at the bottom
            padding: EdgeInsets.only(bottom: 50.0), // Add bottom padding
            child: ElevatedButton(
              onPressed: () {
                // Action to perform when button is pressed
              },
              child: Container(
                width: 100.0, // Set width of container
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero, // Remove padding
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}