import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Box'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
    
          children: [
          ElevatedButton(onPressed: (){
              controller.insertStudent();
          }, child: Text("Insert Student")),

          ElevatedButton(onPressed: (){
              controller.getStudent();
          }, child: Text("Get Student")),
          if(controller.studentData!=null)
          Obx(() => Expanded(
                      child: ListView.builder(
                        itemCount: controller.studentData.length,
                        itemBuilder:(context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(children: [
                                   Text(controller.studentData[index].studentName),
                                   Text(controller.studentData[index].address),
                                   Text(controller.studentData[index].age.toString()),
                                   Text(controller.studentData[index].totalMarks.toString())
                                  ],),
                                ),
                                Column(
                                  children: [
                                    IconButton(onPressed: (){
                            controller.deleteStudent(index);
                          }, icon: Icon(Icons.delete,color: Colors.red,)),
                          IconButton(onPressed: (){
                            controller.updateStudent(index);
                          }, icon: Icon(Icons.edit,color: Colors.blue,))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },),
          )),
          // if(controller.studentData!=null)...{
          //    Text(controller.studentData!.studentName),
          //    Text(controller.studentData!.address),
          //    Text(controller.studentData!.age.toString()),
          //    Text(controller.studentData!.totalMarks.toString())
          // }
        ],),
      )
    );
  }
}
