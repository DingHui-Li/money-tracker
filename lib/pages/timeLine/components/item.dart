import 'package:flutter/material.dart';

class ConsumeItem extends StatelessWidget {
  const ConsumeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      {
        'color': Colors.amber,
      },
      {
        'color': Colors.red,
      },
      {
        'color': Colors.green,
      },
      {
        'color': Colors.black,
      }
    ];
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(),
          ...list.asMap().keys.map((index) {
            var item = list[index];
            return Item(index: index, color: item['color']);
          }).toList()
        ],
      ),
    );
  }

  Widget Header() {
    return ListTile(
      leading: ClipOval(
        child: Container(
          width: 40,
          height: 40,
          // color: Color(0xffe0e0e0),
          color: Colors.black,
          child: Center(
            child: Text(
              '14',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      title: const Text(
        '2023-7-14',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text.rich(
        TextSpan(text: "共支出", style: TextStyle(fontSize: 12), children: [
          TextSpan(
            text: '￥142',
            style: TextStyle(color: Colors.red, fontSize: 12),
          )
        ]),
      ),
    );
  }

  Widget Item({index, color}) {
    Color borderColor = Color(0xffe0e0e0);
    // Color borderColor = Colors.red;
    double marginLeft = 35;
    Color bgColor = Colors.white;

    Widget line = Container(
      height: 33,
      margin: EdgeInsets.only(left: marginLeft),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            borderColor,
            borderColor,
            bgColor,
          ],
          stops: const [0, 0.12, 0.12],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Transform.translate(
        offset: const Offset(1, -1),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(marginLeft, index == 0 ? -17 : -50),
          child: Container(
            width: 1,
            height: index == 0 ? 20 : 50,
            decoration: BoxDecoration(
              color: borderColor,
              gradient: LinearGradient(
                colors: [
                  borderColor,
                  borderColor.withOpacity(index == 0 ? 1 : 0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        line,
        Container(
          padding: EdgeInsets.only(left: marginLeft + 18),
          child: ListTile(
            dense: true,
            leading: Icon(
              Icons.food_bank,
              color: color,
            ),
            title: Text.rich(
              TextSpan(text: '餐饮', style: TextStyle(fontSize: 14), children: [
                WidgetSpan(
                  child: SizedBox(
                    width: 6,
                  ),
                ),
                TextSpan(
                  text:
                      'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                )
              ]),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '13:15',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              '-￥14',
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
