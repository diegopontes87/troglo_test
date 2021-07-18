import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppDropdownMenuWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String? selectedStatus;
  final Function onChange;
  final List<String?> groupNamesList;

  AppDropdownMenuWidget({
    required this.onChange,
    required this.groupNamesList,
    required this.selectedStatus,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppRes.appColorTheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppRes.appColorTheme.primary, width: 1.propWidth(), style: BorderStyle.solid),
      ),
      child: PopupMenuButton<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        itemBuilder: (context) {
          return groupNamesList.map((element) {
            return PopupMenuItem(
              value: element,
              child: Container(
                width: Get.width,
                margin: EdgeInsets.all(10),
                child: AppTextWidget(
                  text: element,
                  style: AppRes.bodyText1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList();
        },
        child: Container(
          height: 40.propHeight(),
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppTextWidget(
                margin: EdgeInsets.only(left: 5.propWidth(), bottom: 5.propHeight()),
                text: selectedStatus,
                style: AppRes.bodyText1,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(Icons.arrow_drop_down, size: 35),
            ],
          ),
        ),
        onSelected: (newValue) => onChange(newValue),
      ),
    );
  }
}
