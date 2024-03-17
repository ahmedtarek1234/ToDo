import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/Task_model.dart';
import 'package:todo/firbaseFunctions.dart';
import 'package:todo/home/add_task_bottomSheet.dart';

class taskItem extends StatelessWidget {
  TaskModel model;

  taskItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirbaseFunctions.deleteTask(model.id);
            },
            label: AppLocalizations.of(context)!.delete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          SlidableAction(
            onPressed: (context) {
            },
            label: AppLocalizations.of(context)!.edit,
            backgroundColor: Colors.blue,
            icon: Icons.edit,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: 75,
                width: 4,
                color: Colors.blue,
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    model.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    model.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    width: 50,
                    height: 28,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
