import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  bool isLight=true;
   ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               AppLocalizations.of(context)!.light,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color:isLight? Colors.blue:Colors.black),
              ),
              isLight?Icon(Icons.done, size: 30, color: Colors.blue):SizedBox(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.dark,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color:isLight?Colors.black: Colors.blue),
              ),
              isLight?SizedBox():Icon(Icons.done, size: 30, color: Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}
