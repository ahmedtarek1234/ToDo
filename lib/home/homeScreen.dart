import 'package:flutter/material.dart';
import 'package:todo/home/add_task_bottomSheet.dart';
import 'package:todo/home/tabs/settingTaB.dart';
import 'package:todo/home/tabs/taskTaB.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class homeScreen extends StatefulWidget {
  static const String routename = "homeScreen";

  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Widget> tabs = [
    tasksTab(),
    settingsTab(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Color(0XFFDFECDB),
        appBar: AppBar(
          backgroundColor: Color(0XFF5D9CEC),
          title: Text(
           AppLocalizations.of(context)!.todo_list,
            style: TextStyle(fontSize: 27),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,

            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/list-icon.png"),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/setting-icon.png"),
                  ),
                  label: "")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white, width: 2)),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                    child: bottomSheet());
              },
            );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: tabs[index]);
  }
}
