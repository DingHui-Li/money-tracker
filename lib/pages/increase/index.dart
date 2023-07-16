import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/pages/increase/controller/index.dart';

enum KeyType { number, dot, minus, plus, del, save, again }

class IncreasePage extends StatelessWidget {
  IncreasePage({Key? key}) : super(key: key);

  IncreaseController _increaseController = Get.put(IncreaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          '2023.7.16',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff00509F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '￥',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Text(
                      _increaseController.inputValue.value,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 15, 15),
            child: Text(
              '水电',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Types()),
                Input(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget Types() {
    var list = [
      {'text': "水电", "icon": Icons.water_drop_outlined},
      {'text': "交通", "icon": Icons.traffic},
      {'text': "三餐", "icon": Icons.food_bank_outlined},
      {'text': "住房", "icon": Icons.home_work_outlined},
      {'text': "水电", "icon": Icons.water_drop_outlined},
      {'text': "交通", "icon": Icons.traffic},
      {'text': "三餐", "icon": Icons.food_bank_outlined},
      {'text': "住房", "icon": Icons.home_work_outlined},
      {'text': "水电", "icon": Icons.water_drop_outlined},
      {'text': "交通", "icon": Icons.traffic},
      {'text': "三餐", "icon": Icons.food_bank_outlined},
      {'text': "住房", "icon": Icons.home_work_outlined},
    ];
    Widget getItem(item) {
      return CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ]),
                child: Center(
                  child: Icon(
                    item['icon'],
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Text(
                item['text'],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () {});
    }

    return GridView.builder(
      itemBuilder: (_, index) => getItem(
        list[index],
      ),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
    );
  }

  Widget Input() {
    List keys = [
      {'text': '1', 'type': KeyType.number, 'value': 1},
      {'text': '2', 'type': KeyType.number, 'value': 2},
      {'text': '3', 'type': KeyType.number, 'value': 3},
      {'text': 'del', 'type': KeyType.del},
      {'text': '4', 'type': KeyType.number, 'value': 4},
      {'text': '5', 'type': KeyType.number, 'value': 5},
      {'text': '6', 'type': KeyType.number, 'value': 6},
      {'text': '—', 'type': KeyType.minus},
      {'text': '7', 'type': KeyType.number, 'value': 7},
      {'text': '8', 'type': KeyType.number, 'value': 8},
      {'text': '9', 'type': KeyType.number, 'value': 9},
      {'text': '+', 'type': KeyType.plus},
      {'text': '再记', 'type': KeyType.again},
      {'text': '0', 'type': KeyType.number, 'value': 0},
      {'text': '.', 'type': KeyType.dot, 'value': '.'},
      {'text': '保存', 'type': KeyType.save},
    ];
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: keys.length,
        itemBuilder: (_, index) {
          var key = keys[index];
          return Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                switch (key['type']) {
                  case KeyType.dot:
                    _increaseController.change(key['value']);
                    break;
                  case KeyType.number:
                    _increaseController.change(key['value'].toString());
                    break;
                  case KeyType.del:
                    _increaseController.del();
                    break;
                  case KeyType.minus:
                    _increaseController.change('—');
                    break;
                  case KeyType.plus:
                    _increaseController.change('+');
                    break;
                }
              },
              child: Center(
                child: Text(
                  keys[index]['text'],
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
