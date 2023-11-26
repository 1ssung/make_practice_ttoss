import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discorvery.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../common/common.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);

  // late 키워드는 생섬자가 필요한 시점에 초기화가 이루어진다.
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.appColors.roundedLayoutBackground,
            actions: [
              ImageButton(
                  imagePath: '$basePath/icon/stock_search.png',
                  onTap: () {
                    Nav.push(SearchStockScreen());
                  }),
              ImageButton(
                  imagePath: '$basePath/icon/stock_calendar.png',
                  onTap: () {
                    context.showSnackbar('캘린더');
                  }),
              ImageButton(
                  imagePath: '$basePath/icon/stock_settings.png',
                  onTap: () {
                    context.showSnackbar('설정');
                  }),
            ],
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                title,
                tabBar,
                if (currentIndex == 0)
                  MyStockFrament()
                else
                  TodaysDiscoveryFragment()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '토스증권'.text.size(20).bold.make().pOnly(left: 12),
            width20,
            'S&P 500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width20,
            3919.29
                .toComma()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make(),
          ],
        ),
      );

  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelPadding: EdgeInsets.symmetric(vertical: 20),
                //indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: [
                  '내 주식'.text.make(),
                  '오늘의 발견'.text.make(),
                ]),
            const Line(),
          ],
        ),
      );

  Widget get myAccount => Placeholder();

  Widget get myStocks => Placeholder();
}
