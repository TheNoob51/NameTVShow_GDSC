import 'package:flutter/services.dart';
import 'package:nameshow/const/colors.dart';

import 'linkers.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.size(18).color(grey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.size(16).color(grey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color: red,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: white,
                title: "Yes"),
            ourButton(
                color: grey,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: white,
                title: "No"),
          ],
        ),
      ],
    ).box.color(white).padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}
