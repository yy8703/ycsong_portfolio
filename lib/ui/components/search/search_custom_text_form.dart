import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCustomTextForm extends StatelessWidget {
  const SearchCustomTextForm({
    super.key,
    required this.width,
    required this.height,
    required this.controller,
    required this.name,
    required this.maxLength,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.initialValue,
  });

  final double width;
  final double height;
  final TextEditingController controller;
  final String name;
  final int maxLength;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        color: Colors.transparent,
        height: 40.w,
        alignment: Alignment.center,
        child: FormBuilderTextField(
          textAlign: TextAlign.center,
          controller: controller,
          name: name,
          maxLength: maxLength,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey),
            border: InputBorder.none,
            helperStyle: const TextStyle(fontSize: 0),
            isDense: true,
            contentPadding: EdgeInsets.only(top: 10.w),
            constraints: BoxConstraints(
              minHeight: 40.w,
              maxHeight: 40.w,
            ),
          ),
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
          initialValue: initialValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
