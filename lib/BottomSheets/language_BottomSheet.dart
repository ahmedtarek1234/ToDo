import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/myProvider.dart';

class langBottomSheet extends StatelessWidget {
   langBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changeLanguage("en");


                },
                child: Text(
                  AppLocalizations.of(context)!.english,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color:provider.languageCode=="en"? Colors.blue:Colors.black),
                ),
              ),
              provider.languageCode=="en"?Icon(Icons.done, size: 30, color: Colors.blue):SizedBox(),
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
                  provider.changeLanguage("ar");

                },
                child: Text(
                  AppLocalizations.of(context)!.arabic,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color:provider.languageCode=="en"?Colors.black: Colors.blue),
                ),
              ),
              provider.languageCode=="en"?SizedBox():Icon(Icons.done, size: 30, color: Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}
