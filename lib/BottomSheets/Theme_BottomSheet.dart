import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/myProvider.dart';

class ThemeBottomSheet extends StatelessWidget {
  bool isLight=true;
   ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.light);
                },
                child: Text(
                 AppLocalizations.of(context)!.light,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: provider.themeMode==ThemeMode.light? Colors.blue:Colors.black),
                ),
              ),
              provider.themeMode==ThemeMode.light?Icon(Icons.done, size: 30, color: Colors.blue):SizedBox(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: Text(
                  AppLocalizations.of(context)!.dark,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color:provider.themeMode==ThemeMode.light?Colors.black: Colors.blue),
                ),
              ),
              provider.themeMode==ThemeMode.light?SizedBox():Icon(Icons.done, size: 30, color: Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}
