import 'package:flutter/material.dart';
import 'package:todo/BottomSheets/Theme_BottomSheet.dart';
import 'package:todo/BottomSheets/language_BottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class settingsTab extends StatelessWidget {
  static const String routename = "settingsTab";

  const settingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: langBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(AppLocalizations.of(context)!.english),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(AppLocalizations.of(context)!.light,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
