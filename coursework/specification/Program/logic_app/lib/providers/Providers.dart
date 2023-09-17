import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:logic_app/functions/DatabaseHelper.dart';
import 'package:logic_app/functions/QuestionsCard.dart';
import 'package:sqflite/sqflite.dart';

final bottomBarProvider = ChangeNotifierProvider((ref) => BottomBar());
final darkModeProvider = ChangeNotifierProvider((ref) => DarkMode());
final dataBaseProvider = ChangeNotifierProvider((ref) => DatabaseHelper.instance);

class BottomBar extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class DarkMode extends ChangeNotifier{
  bool initialValue = true;
  void onTap(bool value){
    initialValue = value;
    print(initialValue);
    notifyListeners();
  }
}

Future<int> amout(ref) async{
  return await ref.watch(dataBaseProvider).getAmount();
}

// confirmDialog() {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('标题'),
//           content: Text('这里可以写描述相关提示信息'),
//           actions: [ TextButton(child: Text('取消'),onPressed: (){},),
//             TextButton(child: Text('确认'),onPressed: (){},),],
//         );
//       });
// }

