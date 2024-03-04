import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

import 'widgets/category_tile.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "All Category",
          style: appStyle(
            12,
            kGray,
            FontWeight.w600,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: CategoryTile(category: Category)),
    );
  }
}
