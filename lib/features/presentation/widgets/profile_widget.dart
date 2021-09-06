

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget profileWidget({String? imageUrl,File? image}){
  print("image value $image");
  if (image==null){
    if (imageUrl==null)
      return Image.asset(
        'assets/profile_default.png',
        fit: BoxFit.cover,
      );
    else
      return CachedNetworkImage(
        imageUrl: "$imageUrl",
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            SizedBox(height: 50,width: 50,child: Container(margin: EdgeInsets.all(20),child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
  }else{
    return Image.file(image,fit: BoxFit.cover,);
  }
}