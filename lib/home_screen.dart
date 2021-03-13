import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: Text('TeachableMachine CNN'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Detect dogs and cats', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Center(
              child: isLoading
                  ? Column(
                      children: [
                        FlutterLogo(size: 250),
                        SizedBox(height: 50),
                      ],
                    )
                  : CircularProgressIndicator(),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Take a photo')),
                  ElevatedButton(onPressed: () {}, child: Text('Camera roll')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
