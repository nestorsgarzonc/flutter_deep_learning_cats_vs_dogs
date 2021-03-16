import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((e) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite?.close();
    super.dispose();
  }

  void pickImage() async {
    setState(() => isLoading = true);
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() => _image = File(image.path));

    classifyImage(_image);
  }

  void classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: _image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      _output = output;
      isLoading = false;
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

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
              child: !isLoading
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
                  ElevatedButton(onPressed: pickImage, child: Text('Camera roll')),
                ],
              ),
            ),
            const SizedBox(height: 50),
            if (_output != null) Text('${_output[0]}')
          ],
        ),
      ),
    );
  }
}
