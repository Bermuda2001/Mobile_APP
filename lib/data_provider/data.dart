import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class data_c extends ChangeNotifier {
  List picCorrect = [];
  List picStudent = [];
  TextEditingController Name_Class_Controller = TextEditingController();
  TextEditingController Homework_Controller = TextEditingController();
  TextEditingController Homework_Score_Controller = TextEditingController();
  TextEditingController Student_Name_Controller = TextEditingController();
  TextEditingController Student_Total_Controller = TextEditingController();


  List<String> class_Name = [];
  List<String> homework_name = [];
  List homework_score = [];
  List<String> student_name = [];
  List student_total = [];


  void deleteToList_homework(index) {
    homework_name.removeAt(index);
    notifyListeners();
    print(homework_name);
  }

  void addToList_classname() {
    class_Name.add(Name_Class_Controller.text);
    Name_Class_Controller.clear();
    print(class_Name);
  }

  void addToList_homework() {
    homework_name.add(Homework_Controller.text);
    Homework_Controller.clear();
    print(homework_name);
  }

  void addToList_homework_score() {
    homework_score.add(Homework_Score_Controller.text);
    homework_score.clear();
    print(homework_score);
  }
  void addToList_student_name() {
    student_name.add(Student_Name_Controller.text);
    student_name.clear();
    print(student_name);
  }
  void addToList_student_total() {
    var nums = int.parse(Student_Total_Controller.text);
    student_total.add(nums);
    Student_Total_Controller.clear();
    print(student_total);
  }

  data_SET() {
    var class_data = {
      1: {
        "class": {
          'name': 'borebo classroom',
          'Students': {
            1: {
              'nanme': 'borebo',
              'image': "url",
              'score': [],
            },
            2: {
              'nanme': 'borebo',
              'image': "url",
              'score': [],
            },
          },
          'HomeWorkTitle':[{'title':"",'total':10}],

          'TotalStudent': 0,
          'imgUrl_Correct': [],
        },
      }
    };
    // class_data[1]["class"]['Students'] = {2: {
    //   'nanme': 'borebo',
    //   'image': "url",
    //   'score': 1,
    // },
    }
  }

