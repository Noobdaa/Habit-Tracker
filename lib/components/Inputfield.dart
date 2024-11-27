import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_cooked/components/Themes.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyTextField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(height:6),
          Container(
            height: 52,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide.none),
              color: Colors.black45,
              borderRadius: BorderRadius.circular(20.0)
                ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.red,
                    controller: controller,
                    style: subtitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtitleStyle,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.white10,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 1.5,
                        ),
                      ),
                    ),
                   )
                  ),
                  widget == null?Container():Container(child: widget,)
                ],
              ),
          )
        ],
      ),
    );
  }
}
