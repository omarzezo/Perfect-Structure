import 'package:flutter/material.dart';
import 'package:perfection_structure/core/custom/p_text.dart';
import 'package:perfection_structure/core/global/app_colors.dart';
import 'package:perfection_structure/core/global/global_enum.dart';




AppBar appBar({String? text, bool isCenter = false,bool backBtn = true,required BuildContext context,List<Widget>? actions,
  refreshCheck=true,double? elevation,Widget? titleWidget}){
  return AppBar(
      centerTitle: isCenter,titleSpacing: 0,bottomOpacity: 0,
      elevation: elevation ?? 0.3,
      backgroundColor: AppColors.primaryColor,title: Padding(
        padding: const EdgeInsets.only(right:0),
        child: Row(
    mainAxisAlignment:isCenter? MainAxisAlignment.center:MainAxisAlignment.start,
    children: [
        // if(text == null)const PImage("Logo (2)",width: 30,height: 30,fit: BoxFit.scaleDown),
        if(text != null) Flexible(child: titleWidget ?? PText(title: text, size: PSize.large,fontColor: AppColors.whiteColor,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis)),
    ],
  ),
      ),
      leading: backBtn ? IconButton(onPressed: ()=> Navigator.pop(context,refreshCheck),
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.whiteColor)) : null,
  actions: actions);


}

