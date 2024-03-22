import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/password_controller.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordcontroller = Get.put(PasswordController());
    return Obx(() => TextFormField(
          cursorColor: kDark,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: passwordcontroller.password,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter valid password';
            } else {
              return null;
            }
          },
          style: appStyle(12, kDark, FontWeight.normal),
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: const Icon(
              CupertinoIcons.lock_circle,
              size: 26,
              color: kGrayLight,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                passwordcontroller.setPassword = !passwordcontroller.password;
              },
              child: Icon(
                passwordcontroller.password
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 26,
                color: kGrayLight,
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(6.h),
            hintStyle: appStyle(12, kGray, FontWeight.w600),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kRed, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kRed, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kGray, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
          ),
        ));
  }
}
