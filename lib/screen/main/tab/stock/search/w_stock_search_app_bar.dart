import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';

class StockSearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const StockSearchAppbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: SizedBox(
                  width: 56,
                  height: kToolbarHeight,
                  child: Arrow(
                    direction: AxisDirection.left,
                  )),
            ),
            Expanded(
                child: TextFieldWithDelete(
              controller: controller,
              textInputAction: TextInputAction.search,
              texthint: " '커피를 검색해보세요.'",
                  onEditingComplete: (){
                debugPrint('검색확인버튼');
                AppKeyboardUtil.hide(context);
                  },
            ).pOnly(top: 6)),
            width20,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
