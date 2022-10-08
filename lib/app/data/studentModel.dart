// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class Student {
  int? id;
  String studentName;
  int age;
  String address;
  DateTime dateOfBirth; 
  double totalMarks;
  //List<Subject> subjects;
  Student({
    this.id,
    required this.studentName,
    required this.age,
    required this.address,
    required this.dateOfBirth,
    required this.totalMarks,
    //required this.subjects,
  });
}

// class Subject {
//   String subjectName;
//   double mark;
//   Subject({
//     required this.subjectName,
//     required this.mark,
//   });
// }
