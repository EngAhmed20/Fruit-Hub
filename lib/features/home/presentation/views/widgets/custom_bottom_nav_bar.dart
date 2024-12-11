import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/features/home/domain/entities/bottom_nav_bar_entity.dart';

import '../../../../../generated/assets.dart';
import 'navigate_bottom_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}


class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Container(
      height: width*.15,
      decoration: const ShapeDecoration(shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      shadows:[
        BoxShadow(
          color: Color(0x19000000),
          offset: Offset(0,-5),
          blurRadius: 3,
          spreadRadius:0
        )

      ],
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: BottomNavBarEntityList.asMap().entries.map((e){
          var entity=e.value;
          var index=e.key;
          return Expanded(
            flex: selectedIndex==index?3:2,
            child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex=index;
                  });
                },
                child: NavBottomBarItem(isSelected: index==selectedIndex, entity: entity)),
          );
        }).toList(),

      ),
    );
  }
}



