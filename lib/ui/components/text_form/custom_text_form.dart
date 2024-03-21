import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.name,
    required this.maxLength,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.initialValue,
  });

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
      width: 230.w,
      height: 40.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w),
      ),
      child: Container(
        color: Colors.transparent,
        height: 40.w,
        alignment: Alignment.center,
        child: FormBuilderTextField(
          textAlign: TextAlign.left,
          controller: controller,
          name: name,
          maxLength: maxLength,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
            border: InputBorder.none,
            helperStyle: const TextStyle(fontSize: 0),
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10.w, top: 12.w),
            constraints: BoxConstraints(
              minHeight: 40.w,
              maxHeight: 40.w,
            ),
          ),
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
          initialValue: initialValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
