import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:money_tracker/components/bottomBar.dart';
import 'package:money_tracker/pages/increase/index.dart';
import 'package:money_tracker/pages/mine/index.dart';
import 'package:money_tracker/pages/timeLine/index.dart';

void main() {
  runApp(MoneyTracker());
}

class MoneyTracker extends StatefulWidget {
  const MoneyTracker({Key? key}) : super(key: key);

  @override
  _MoneyTrackerState createState() => _MoneyTrackerState();
}

class _MoneyTrackerState extends State<MoneyTracker> {
  List tabs = [() => ConsumeTimeLinePage(), () => MinePage()];
  int tabIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: tabs[tabIndex](),
          bottomNavigationBar: BottomBar(
            currentIndex: tabIndex,
            // selectedColor: TrainTravel.theme.primaryColor,
            items: [
              BottomBarItem(icon: Icons.timeline),
              BottomBarItem(icon: Icons.analytics),
            ],
            centerBtn: Container(
              margin: EdgeInsets.only(bottom: 5, top: 5),
              child: AspectRatio(
                aspectRatio: 1,
                child: CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  padding: EdgeInsets.all(0),
                  color: Color(0xffFF2130),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(IncreasePage());
                  },
                ),
              ),
            ),
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
