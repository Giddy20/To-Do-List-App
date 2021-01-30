import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/TodoController.dart';
import 'package:todo_list/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final int index;

  TodoScreen({this.index});
  @override
  Widget build(BuildContext context) {
    String text;
    if(this.index != null){
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(
      text: text,
    );

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "What do you want to accomplish",
                  focusedBorder: InputBorder.none,
                ),
                maxLines: 999,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(onPressed: (){
                    Get.back();
                  },
                  child: Text('Cancel'),
                  color: Colors.red,),
                  RaisedButton(onPressed: (){
                    if (this.index == null){
                      todoController.todos.add(
                        Todo(text: textEditingController.text),
                      );
                    }

                    else {
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }

                    Get.back();
                  },
                  child: Text(this.index == null ? 'Add' : 'Edit'),
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
