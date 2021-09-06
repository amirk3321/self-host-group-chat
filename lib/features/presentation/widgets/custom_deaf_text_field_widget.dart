

import 'package:flutter/material.dart';

class CustomDeafTextFieldWidget extends StatefulWidget {
  final TextEditingController? textEditingController;
  const CustomDeafTextFieldWidget({Key? key,this.textEditingController}) : super(key: key);

  @override
  _CustomDeafTextFieldWidgetState createState() => _CustomDeafTextFieldWidgetState();
}

class _CustomDeafTextFieldWidgetState extends State<CustomDeafTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(80)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                offset: Offset(0.0, 0.50),
                spreadRadius: 1,
                blurRadius: 1,
              )
            ]),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 60),
                  child: Scrollbar(
                    child: TextField(
                      autofocus: true,
                      style: TextStyle(fontSize: 14),
                      controller: widget.textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message"),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.link,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: 10,
                ),
                widget.textEditingController!.text.isEmpty
                    ? Icon(
                  Icons.camera_alt,
                  color: Colors.grey[500],
                )
                    : Text(""),
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }



}
