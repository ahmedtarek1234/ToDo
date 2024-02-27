import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class langBottomSheet extends StatelessWidget {
  bool isEnglish =true;
   langBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.english,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color:isEnglish? Colors.blue:Colors.black),
              ),
              isEnglish?Icon(Icons.done, size: 30, color: Colors.blue):SizedBox(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.arabic,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color:isEnglish?Colors.black: Colors.blue),
              ),
              isEnglish?SizedBox():Icon(Icons.done, size: 30, color: Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}
