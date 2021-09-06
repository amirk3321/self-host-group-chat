import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:self_host_group_chat_app/features/presentation/widgets/theme/style.dart';

typedef TabClickListener=Function(int index);
class CustomTabBar extends StatefulWidget {
  final TabClickListener tabClickListener;
  final index;

  const CustomTabBar({Key? key, this.index = 0,required this.tabClickListener}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _indexHolder=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBarCustomButton(
              width: 50,
              text: "Groups",
              textColor: widget.index == 0 ? textIconColor : textIconColorGray,
              borderColor: widget.index == 0 ? textIconColor : Colors.transparent,
              onTap: (){
                setState(() {
                  _indexHolder=0;
                });
                widget.tabClickListener(_indexHolder);
              },
            ),
          ),
          Expanded(
            child: TabBarCustomButton(
              text: "Users",
              textColor: widget.index == 1 ? textIconColor : textIconColorGray,
              borderColor: widget.index == 1 ? textIconColor : Colors.transparent,
              onTap: (){
                setState(() {
                  _indexHolder=1;
                });
                widget.tabClickListener(_indexHolder);
              },
            ),
          ),
          Expanded(
            child: TabBarCustomButton(
              text: "Profile",
              textColor: widget.index == 2 ? textIconColor : textIconColorGray,
              borderColor: widget.index == 2 ? textIconColor : Colors.transparent,
              onTap: (){
                setState(() {
                  _indexHolder=2;
                });
                widget.tabClickListener(_indexHolder);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarCustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;
  final VoidCallback onTap;

  const TabBarCustomButton({
    Key? key,
    this.text="",
    this.width = 50.0,
    this.height = 50.0,
    this.borderColor = Colors.white,
    this.borderWidth = 3.0,
    this.textColor = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: borderColor, width: borderWidth))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}
