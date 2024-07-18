import 'package:flutter/cupertino.dart';

MySizedBox({double height=0,double width=0}){
  if(width==0)
    {
      return SizedBox(height: height);
    }
  else{
    return SizedBox(width: width);
  }
}