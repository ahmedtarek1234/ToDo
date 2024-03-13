import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/Task_model.dart';
import 'package:todo/firbaseFunctions.dart';
import 'package:todo/task_item.dart';

class tasksTab extends StatefulWidget {

   tasksTab({super.key});

  @override
  State<tasksTab> createState() => _tasksTabState();
}

class _tasksTabState extends State<tasksTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          locale: "en",
          DateTime.now(),
          dateTextStyle: TextStyle(fontSize: 18, color: Color(0XFF5D9CEC)),
          monthTextStyle: TextStyle(fontSize: 13, color: Color(0XFF5D9CEC)),
          dayTextStyle: TextStyle(fontSize: 13, color: Color(0XFF5D9CEC)),
          initialSelectedDate: selectedDate,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            selectedDate=date;
            setState(() {

            });
            // New date selected
            // setState(() {
            //   _selectedValue = date;
            // });
          },
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirbaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went Wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              List<TaskModel> TasksList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              if(TasksList.isEmpty){
                return Center(child: Text("No Tasks"));
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return taskItem(model:TasksList[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemCount: TasksList.length);
            },
          ),
        )
      ],
    );
  }
}
