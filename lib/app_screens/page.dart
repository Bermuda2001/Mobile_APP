import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_provider/data.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_compare/image_compare.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE88C9A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Image.asset('pic/logo.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFBC6472),
                  ),
                  child: const Text('START',style: TextStyle(fontSize: 25),)),
            ),
          ],
        ),
      ),
    );
  }
}



class compare_pic extends StatelessWidget {
  const compare_pic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFFE88C9A),
          appBar: AppBar(
            backgroundColor: const Color(0xFFA84251),
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Image(
                    image: AssetImage('pic/icon.png'),
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Drawing Checky',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                )
              ],
            ),
            centerTitle: true,
          ),
          body: const Center(
            child: _buttonselectImage(),
          ),
        ));
  }
}

class _buttonselectImage extends StatefulWidget {
  const _buttonselectImage({Key? key}) : super(key: key);

  @override
  State<_buttonselectImage> createState() => _buttonselectImageState();
}

class _buttonselectImageState extends State<_buttonselectImage> {
  late File a;
  bool imageHave = false;
  late File b;
  bool imageHave1 = false;

  Future<void> img() async {
    final ImagePicker _picker1 = ImagePicker();
    // Pick an image
    final XFile? image = await _picker1.pickImage(source: ImageSource.gallery);
    setState(() {
      a = File(image!.path);
      imageHave = true;
    });
  }

  Future<void> img1() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      b = File(image!.path);
      imageHave1 = true;
    });
  }

  double score = 0.0;

  Future result() async {
    var Result =
        await compareImages(src1: a, src2: b, algorithm: IMED(blurRatio: 0.1));
    print('Point: ${(100 - (Result * 100)) / 10}');
    setState(() {
      score = (100 - (Result * 100)) / 10;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget show_score(contexts) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score: ${score.toStringAsFixed(2)} /10',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(contexts);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBC6472),
              ),
              child: const Text(
                'close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFA84251))),
            child: (imageHave)
                ? Image(
                    image: FileImage(a), width: 150,
                  )
                : const Center(
                    child: Text('Please upload image'),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBC6472),
              ),
              onPressed: () {
                img().then((value) => debugPrint('$a'));
              },
              child: const Text('Answer Image')),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFA84251))),
            child: (imageHave1)
                ? Image(
                    image: FileImage(b),
                  )
                : const Center(
                    child: Text('Please upload image'),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBC6472),
              ),
              onPressed: () {
                img1().then((value) => debugPrint('$b'));
              },
              child: const Text('Student Image')),
          SizedBox(height: 50,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFBC6472),
            ),
            onPressed: () {
              result();
              showDialog(
                  context: context, builder: (BuildContext context) => Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  backgroundColor: const Color(0xFFA84251),
                  child: show_score(context)
              ));
            },
            child: const Text('CHECK'),
          ),
        ],
      ),
    );
  }
}
