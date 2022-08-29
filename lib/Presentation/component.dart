import 'package:flutter/material.dart';

Widget DefaultFormField(
    {required TextEditingController controller,
      required TextInputType type,
      void Function(String)? onSubmit,
      void Function(String)? onChange,
      void Function()? onTap,
      bool isPassword = false,
      required String? Function(String?)? validate,
      required String label,
      String?ini,
       IconData? prefix,
      IconData? suffix,
      void Function()? suffixPressed,
      bool isClickable = true,
      void Function(String)? onPressed}
    )=>TextFormField(
  initialValue: ini,
  style: TextStyle(),
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,


    ),
    suffixIcon: suffix != null
        ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    )
        : null,
    border:OutlineInputBorder()
  ),
);
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
