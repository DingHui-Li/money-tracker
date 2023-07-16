import 'package:flutter/material.dart';
import 'package:money_tracker/pages/timeLine/components/item.dart';
import 'package:money_tracker/pages/timeLine/components/progress.dart';

class ConsumeTimeLinePage extends StatelessWidget {
  const ConsumeTimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: width * (9 / 16),
          backgroundColor: Color(0xff000000).withOpacity(0.99),
          flexibleSpace: FlexibleSpaceBar(
            background: SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                margin: EdgeInsets.only(bottom: 50),
                child: MoneyProgressOfHome(),
              ),
            ),
            expandedTitleScale: 1,
            titlePadding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            title: Container(
              width: double.infinity,
              // color: Color(0xffC89D29),
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xff00509F),
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xffF53458),
                //     Color(0xffE545E7),
                //   ],
                //   stops: [0, 0.8],
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                // ),
              ),
              child: Text(
                '本期共支出￥123，剩余预算￥2142',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (_, i) => ConsumeItem(),
          itemCount: 10,
        ),
      ],
    );
  }
}
