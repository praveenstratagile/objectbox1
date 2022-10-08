import 'package:get/get.dart';
import 'package:objectbox1/app/data/studentModel.dart';
import 'package:objectbox1/objectbox.g.dart';

class HomeController extends GetxController {

  Student? student;
  late Store store;
  late Box<Student> box;
var studentData=  <Student>[].obs;
  int id = 0;

  @override
  void onInit() async{
     store = await openStore(); 
     box = store.box<Student>();
    super.onInit();
  }

  insertStudent(){
    id=0;
    student = Student(id: id,studentName: "Megha",age: 22,address: "99 strelly street",dateOfBirth: DateTime.now(),
    totalMarks: 270);

    id = box.put(student!);
    print("inserted");
    getStudent();
    
  }

  getStudent(){
    //studentData = box.get(id);
   // print(studentData!.studentName);
   studentData.value =box.query(Student_.studentName.startsWith("")).build().find();
  }

  deleteStudent(int index){
    box.remove(studentData[index].id!);
     getStudent();
  }
  
  void updateStudent(int index) {
     var std = box.get(studentData[index].id!)!;       // Read

     std.studentName = "Safdher sahai";
     box.put(std);  
      getStudent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
