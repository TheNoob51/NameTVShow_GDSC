// ignore_for_file: deprecated_member_use

import 'linkers.dart';

Widget ourButton(
    {onPress, color, textcolor, String? title, required Color textColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
    onPressed: onPress,
    child: title!.text.color(textcolor).make(),
  );
}
