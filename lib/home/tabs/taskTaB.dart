import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/task_item.dart';

class tasksTab extends StatelessWidget {
  const tasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          locale: "en",
          DateTime.now(),
          dateTextStyle:TextStyle(fontSize: 18,color: Color(0XFF5D9CEC)),
          monthTextStyle: TextStyle(fontSize: 13,color: Color(0XFF5D9CEC)),
          dayTextStyle: TextStyle(fontSize: 13,color:  Color(0XFF5D9CEC)),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,

          onDateChange: (date) {
            // New date selected
            // setState(() {
            //   _selectedValue = date;
            // });
          },
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemBuilder: (context, index) {
              return taskItem();
            },
            itemCount: 8,
          ),
        )
      ],
    );
  }
}
