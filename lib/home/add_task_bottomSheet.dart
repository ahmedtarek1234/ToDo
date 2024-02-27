import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class bottomSheet extends StatefulWidget {
  bottomSheet({super.key});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  DateTime choosenDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key:formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 26,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter Task Title";
                }
                return null;
              },
              controller: titleController,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                label: Text(
                  AppLocalizations.of(context)!.title,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please Enter Task Describtion";
                }
                return null;
              },
              controller: describtionController,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                label: Text(
                  AppLocalizations.of(context)!.describtion,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue)),
              ),

            ),
            SizedBox(
              height: 26,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.select_time,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                "${choosenDate.toString().substring(0, 10)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    print("validate");
                  }
                },
                child: Text(AppLocalizations.of(context)!.add_task,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: choosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 360),
      ),
    );
    if (selectedDate != null) {
      choosenDate = selectedDate!;
      setState(() {});
    }
  }
}
