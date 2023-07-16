/*
 * @Author: Link
 * @Date: 2023-06-04 23:19:40
 * @LastEditTime: 2023-06-08 18:52:02
 */
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarItem {
  late IconData icon;
  late String text;
  BottomBarItem({required this.icon, this.text = ''});
}

class BottomBar extends StatefulWidget {
  Function onTap;
  int currentIndex = 0;
  Color color = Colors.black;
  Color selectedColor = Colors.red;
  List<BottomBarItem> items = [];
  Widget? centerBtn;
  BottomBar({
    Key? key,
    required this.onTap,
    required this.items,
    this.currentIndex = 0,
    this.color = Colors.grey,
    this.selectedColor = Colors.red,
    this.centerBtn,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          // padding: EdgeInsets.only(top: 10),
          color: Colors.white.withOpacity(0.1),
          height: 50,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: widget.items.asMap().keys.map<Widget>(
                  (index) {
                    BottomBarItem item = widget.items[index];
                    return Expanded(
                        child: InkWell(
                      onTap: () {
                        widget.onTap(index);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 25,
                            color: index == widget.currentIndex
                                ? widget.selectedColor
                                : widget.color,
                          ),
                          Visibility(
                            visible: item.text != '',
                            child: Text(
                              item.text,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: index == widget.currentIndex
                                      ? widget.selectedColor
                                      : widget.color),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                ).toList(),
              ),
              Visibility(
                visible: widget.centerBtn != null,
                child: Center(child: widget.centerBtn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
