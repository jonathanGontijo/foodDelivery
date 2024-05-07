// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';

import 'package:foodly/common/background_container.dart';
import 'package:foodly/common/custom_button.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/models/order_request.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/orders/widgets/order_tile.dart';
import 'package:foodly/views/restaurant/restaurant_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    Key? key,
    this.restaunt,
    required this.food,
    required this.item,
  }) : super(key: key);
  final RestaurantsModel? restaunt;
  final FoodsModel food;
  final OrderItem item;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.item.additives);
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimary,
          title: ReusableText(
              text: "Complete Ordering",
              style: appStyle(13, kLightWhite, FontWeight.w600))),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              OrderTile(food: widget.food),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: width,
                height: height / 2.5,
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: widget.restaunt!.title,
                          style: appStyle(
                            20,
                            kGray,
                            FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: kPrimary,
                          backgroundImage:
                              NetworkImage(widget.restaunt!.logoUrl),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RowText(
                        first: "Business Hours", second: widget.restaunt!.time),
                    const RowText(
                        first: "Distance from Restaurant", second: "3 km"),
                    const RowText(
                        first: "Price from Restaurant", second: "R\$ 4.00"),
                    SizedBox(
                      height: 5.h,
                    ),
                    RowText(
                        first: "Order Total ",
                        second: widget.item.price.toString()),
                  ],
                ),
              ),
              CustomButton(
                text: "Proced to Payment",
                btnHeight: 45,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
