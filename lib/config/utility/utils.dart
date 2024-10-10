import 'package:flutter/material.dart';

import '../items/app_colors.dart';

class Utils {
  const Utils._();

  /* static Future<void> showFlushbar(
      BuildContext context, FlushbarNotificationModel notificationModel) async {
    await Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.05),
        vertical: context.dynamicHeight(0.02),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.05),
        vertical: context.dynamicHeight(0.02),
      ),
      borderRadius: BorderRadius.circular(context.dynamicWidth(0.05)),
      titleColor: Colors.white,
      icon: CircleAvatar(
        radius: context.dynamicWidth(0.05),
        backgroundColor: AppColors.whiteColor.withOpacity(0.4),
        child: SvgPicture.asset(
          notificationModel.iconPath,
          colorFilter: const ColorFilter.mode(
            AppColors.whiteColor,
            BlendMode.srcIn,
          ),
          width: context.dynamicWidth(0.08),
          height: context.dynamicWidth(0.08),
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: notificationModel.backgroundColor,
      isDismissible: true,
      onTap: (flushbar) => flushbar.dismiss(),
      duration: const Duration(milliseconds: 1500),
      titleText: Text(
        notificationModel.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontSize: context.dynamicWidth(0.04),
              fontWeight: FontWeight.bold,
            ),
      ),
      messageText: Text(
        notificationModel.subtitle,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: context.dynamicWidth(0.035),
              color: AppColors.whiteColor,
            ),
      ),
    ).show(context);
  } */

  /*  static Future<void> showFlushbar(
      BuildContext context, FlushbarNotificationModel notificationModel) async {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      type: notificationModel.type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(
        notificationModel.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontSize: context.dynamicWidth(0.04),
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.justify,
      ),
      description: Text(
        notificationModel.subtitle,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: context.dynamicWidth(0.033),
              color: AppColors.whiteColor,
            ),
        textAlign: TextAlign.justify,
      ),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(
            scale: animation, alignment: Alignment.topRight, child: child);
      },
      // icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      // primaryColor: Colors.green,
      // backgroundColor: Colors.red,
      // foregroundColor: Colors.white,
      // padding: EdgeInsets.symmetric(
      //   horizontal: context.dynamicWidth(0.02),
      //   vertical: context.dynamicHeight(0.02),
      // ),
      // margin: EdgeInsets.symmetric(
      //   horizontal: context.dynamicWidth(0.05),
      //   vertical: context.dynamicHeight(0.02),
      // ),

      borderRadius: BorderRadius.circular(context.dynamicWidth(0.05)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static Future<void> showAppDialog(
    BuildContext context,
    ShowDialogModel showDialogModel,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(showDialogModel.title), //notu sil
          content: Text(showDialogModel
              .content), //Bu notu silmek istediğinizden emin misiniz?
          actions: showDialogModel.action, //İptal, Sil
        );
      },
    );
  } */

  static Future<DateTime> showAppDatePicker(BuildContext context) async {
    DateTime? data;
    await showDatePicker(
      context: context,
      firstDate: DateTime(1980),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        //arka plan beyaz seçili olanın rengi kırmızı olsun
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
            surface: AppColors.whiteColor,
            onSurface: AppColors.blackColor,
            primary: AppColors.darkGrayColor,
          )),
          child: child!,
        );
      },
    ).then(
      (value) async {
        if (value != null) {
          data = value;
        }
      },
    );
    return data ?? DateTime.now();
  }

  static Future<TimeOfDay> showAppTimePicker(BuildContext context) async {
    TimeOfDay? time;
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        //arka plan beyaz seçili olanın rengi kırmızı olsun
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
            surface: AppColors.whiteColor,
            onSurface: AppColors.blackColor,
            primary: AppColors.darkGrayColor,
          )),
          child: child!,
        );
      },
    ).then(
      (value) async {
        if (value != null) {
          time = value;
        }
      },
    );
    return time ?? TimeOfDay.now();
  }

  static void showSnackBar(BuildContext context, String s, Color errorColor) {}
}
