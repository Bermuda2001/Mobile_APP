import 'dart:io';
import 'package:image_compare/image_compare.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class My_App extends StatelessWidget {
  const My_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: _buttonselectImage(),
          ),
        )
    );
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

  Future<void> some() async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      a = File(image!.path);
      imageHave = true;
    });



  }
  Future<void> some1() async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      b = File(image!.path);
      imageHave1 = true;
    });



  }

  Future<void> result() async{
    var Result = await compareImages(src1: a, src2: b, algorithm: IMED(blurRatio: 0.1));
    print('Different: ${Result * 100}%');
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          (imageHave)? Image(image:  FileImage(a), width: 100,): Text('ImageError'),
          ElevatedButton(onPressed: (){

            some().then((value) => debugPrint('$a'));

          }, child: Text('Select Image1')),

          (imageHave)? Image(image:  FileImage(b), width: 100,): Text('ImageError'),
          ElevatedButton(onPressed: (){

            some1().then((value) => debugPrint('$b'));

          }, child: Text('Select Image2')),

          ElevatedButton(onPressed: (){result();}, child: Text('check'))
        ],
      ),
    );
  }
}

// class drawing_checky_page extends StatefulWidget {
//   const drawing_checky_page({Key? key}) : super(key: key);
//
//   @override
//   State<drawing_checky_page> createState() => _drawing_checky_pageState();
// }
//
// class _drawing_checky_pageState extends State<drawing_checky_page> {
//   var index;
//
//   Widget GetListView_class() {
//     var Get_class = Data_Class.Name_Class_Controller.text;
//
//     var tst = Data_Class.class_Name;
//
//     var class_data = {
//       1: {
//         "${Get_class}": {
//           'HomeWorkTitle': {
//             'StudentName': '',
//             'TotalStudent': '',
//             'imgUrl_Correct': '',
//             'imgStudent': '',
//             'score_img': '',
//           },
//         },
//       }
//     };
//
//     var listView = ListView.builder(
//         itemCount: tst.length,
//         itemBuilder: (context, index) {
//           return Consumer<data_c>(builder: (context, LiSt, child) {
//             return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     Navigator.pushNamed(context, '/second/third');
//                   });
//                 },
//                 child: Container(
//                     margin: const EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width / 1,
//                     height: MediaQuery.of(context).size.height / 9,
//                     color: const Color(0xFFEEBBC3),
//                     child: Center(
//                       child: Text(
//                         '${tst[index]}',
//                         style: const TextStyle(color: Color(0xFFA84251)),
//                       ),
//                     )));
//           });
//         });
//     return listView;
//   }
//
//   // Widget Class_total_student(){
//   //   return SizedBox(
//   //     height: MediaQuery.of(context).size.height / 1.5,
//   //     child: SingleChildScrollView(
//   //       child: GetListStudent(0)
//   //     ),    );
//   // }
//
//   Widget ClassAdd(context) {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height / 1.5,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(top: 30, bottom: 20),
//                 child: const Text(
//                   'Create Class',
//                   style: TextStyle(
//                       fontFamily: 'MonomaniacOne',
//                       fontSize: 50,
//                       color: Colors.white),
//                 ),
//               ),
//               const Text(
//                 'Class name',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//               Container(
//                 width: 200,
//                 margin: const EdgeInsets.only(top: 10, bottom: 40),
//                 child: TextField(
//                   style: const TextStyle(color: Color(0xFFA84251)),
//                   controller: Data_Class.Name_Class_Controller,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         width: 3,
//                         color: Colors.white,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                       const BorderSide(width: 3, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     hintText: 'Name Class',
//                   ),
//                   // onChanged: (){},
//                 ),
//               ),
//               const Text(
//                 'Total Student',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//               Container(
//                 width: 200,
//                 margin: const EdgeInsets.only(top: 10, bottom: 40),
//                 child: TextField(
//                   style: const TextStyle(color: Color(0xFFA84251)),
//                   controller: Data_Class.Student_Total_Controller,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         width: 3,
//                         color: Colors.white,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                       const BorderSide(width: 3, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     hintText: 'Student Total',
//                   ),
//                   // onChanged: (){},
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: const Color(0xFFBC6472),
//                       ),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(color: Color(0xFFEEBBC3)),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 10, right: 20),
//                     child: ElevatedButton(
//                         onPressed: () {
//                           setState(
//                                 () {
//                               Data_Class.addToList_classname();
//                               Data_Class.addToList_student_total();
//                               Navigator.pop(context);
//                               Navigator.pushNamed(context, '/second/third');
//                               // showDialog(
//                               //     context: context, builder: (BuildContext context) => Dialog(
//                               //     shape: const RoundedRectangleBorder(
//                               //         borderRadius: BorderRadius.all(Radius.circular(10))
//                               //     ),
//                               //     backgroundColor: const Color(0xFFA84251),
//                               //     child: Container()
//                               // )
//                               // );
//                             },
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: const Color(0xFFEEBBC3),
//                         ),
//                         child: const Text('Create',
//                             style: TextStyle(color: Color(0xFFA84251)))),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFA84251),
//         centerTitle: true,
//         title: const Text(
//           'DRAWING CHECKY',
//           style: TextStyle(fontSize: 30, fontFamily: 'Monomaniac-One'),
//         ),
//       ),
//       backgroundColor: const Color(0xFFE88C9A),
//       body: GetListView_class(),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.white,
//         tooltip: 'Add more classroom',
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) => Dialog(
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   backgroundColor: const Color(0xFFA84251),
//                   child: ClassAdd(context)));
//         },
//         child: const Icon(
//           Icons.add,
//           color: Color(0xFFA84251),
//           size: 50,
//         ),
//       ),
//     );
//   }
// }
//
// class class_page extends StatefulWidget {
//   const class_page({Key? key}) : super(key: key);
//
//   @override
//   State<class_page> createState() => _class_pageState();
// }
//
// var tst_homework = Data_Class.homework_name;
//
// class _class_pageState extends State<class_page> {
//   Widget GetListView_homework() {
//     var listView = ListView.builder(
//         itemCount: tst_homework.length,
//         itemBuilder: (context, index) {
//           return Consumer<data_c>(builder: (context, LiSt, child) {
//             return GestureDetector(
//                 onTap: () {
//                   setState(() {});
//                 },
//                 child: Container(
//                     margin: const EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width / 1,
//                     height: MediaQuery.of(context).size.height / 9,
//                     color: const Color(0xFFEEBBC3),
//                     child: Center(
//                       child: Text(
//                         '${tst_homework[index]}',
//                         style: const TextStyle(color: Color(0xFFA84251)),
//                       ),
//                     )));
//           });
//         });
//     return listView;
//   }
//
//   Widget homework_add(context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height / 1.8,
//       child: Column(
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(top: 30, bottom: 20),
//             child: const Text(
//               'Create Homework',
//               style: TextStyle(
//                   fontFamily: 'MonomaniacOne',
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//           const Text(
//             'Homework name',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           Container(
//             width: 200,
//             margin: const EdgeInsets.only(top: 10, bottom: 40),
//             child: TextField(
//               style: const TextStyle(color: Color(0xFFA84251)),
//               controller: Data_Class.Homework_Controller,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     width: 3,
//                     color: Colors.white,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(width: 3, color: Colors.white),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 hintText: 'Name Homework',
//               ),
//               // onChanged: (){},
//             ),
//           ),
//           const Text(
//             'Score of Homework',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           Container(
//             width: 200,
//             margin: const EdgeInsets.only(top: 10, bottom: 40),
//             child: TextField(
//               keyboardType: TextInputType.number,
//               style: const TextStyle(color: Color(0xFFA84251)),
//               controller: Data_Class.Homework_Score_Controller,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     width: 3,
//                     color: Colors.white,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(width: 3, color: Colors.white),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 hintText: 'Score of homework',
//               ),
//               // onChanged: (){},
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color(0xFFBC6472),
//                   ),
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(color: Color(0xFFEEBBC3)),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 10, right: 20),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       setState(
//                             () {
//                           Data_Class.addToList_homework();
//                           Data_Class.addToList_homework_score();
//                           Navigator.pop(context);
//                           debugPrint('${Data_Class.Homework_Controller}');
//                         },
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: const Color(0xFFEEBBC3),
//                     ),
//                     child: const Text('Create',
//                         style: TextStyle(color: Color(0xFFA84251)))),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var tst = Data_Class.class_Name;
//     var index;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFA84251),
//         centerTitle: true,
//         title: Text(
//           '${tst[index]}',
//           style: const TextStyle(fontSize: 30, fontFamily: 'Monomaniac-One'),
//         ),
//       ),
//       backgroundColor: const Color(0xFFE88C9A),
//       body: GetListView_homework(),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.white,
//         tooltip: 'Add more homework',
//         onPressed: () {
//           // showDialog(
//           //     context: context, builder: (BuildContext context) => Dialog(
//           //     shape: const RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.all(Radius.circular(10))
//           //     ),
//           //     backgroundColor: const Color(0xFFA84251),
//           //     child: homework_add(context)
//           // ));
//         },
//         child: const Icon(
//           Icons.add,
//           color: Color(0xFFA84251),
//           size: 50,
//         ),
//       ),
//     );
//   }
// }
//
// class student_name_list extends StatefulWidget {
//   const student_name_list({Key? key}) : super(key: key);
//
//   @override
//   State<student_name_list> createState() => _student_name_listState();
// }
//
// class _student_name_listState extends State<student_name_list> {
//   Widget GetListStudent() {
//     var index;
//
//     var count = Data_Class.student_total ?? [];
//
//     var listViewStudent = ListView.builder(
//         itemCount: count[index],
//         itemBuilder: (context, index) {
//           return TextField(
//             controller: Data_Class.Student_Name_Controller,
//           );
//         });
//     return listViewStudent;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFA84251),
//         centerTitle: true,
//         title: const Text(
//           'Student Name',
//           style: TextStyle(fontSize: 30, fontFamily: 'Monomaniac-One'),
//         ),
//       ),
//       backgroundColor: const Color(0xFFE88C9A),
//       body: GetListStudent(),
//     );
//   }
// }