



import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget loadingIndicatorProgressBar({String? data}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.orange,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data==null?"Setting up your account please wait..":data,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

void snackBarNetwork({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  scaffoldState!.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$msg"),
          Icon(FontAwesome.exclamation_triangle)
        ],
      ),
    ),
  );
}


void snackBar({required String msg, required GlobalKey<ScaffoldState> scaffoldState}) {
  scaffoldState.currentState!.showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(msg,style: TextStyle(fontWeight: FontWeight.w500),),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}


void push({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}


//TODO:common button [Today,this week,this month]
Widget verticalDivider(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    height:18,
    width: 1.0,
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(.4)
    ),
  );
}
