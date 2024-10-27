import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import 'package:since_date/since_date.dart';
import '../../../models/notification_model.dart';

class NotifyWidget extends StatelessWidget {
  NotificationModel notificationModel;
  NotifyWidget({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Icon(
              CupertinoIcons.bell,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Gap(Insets.medium),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "اشتراكك علئ وشك النفاذ",
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(),
                    ),
                  ),
                  SinceDate(
                    DateTime.now(),
                    textStyle: const TextStyle(color: Color(0xFF7C758A)),
                  ),
                ],
              ),
              Gap(Insets.exSmall),
              const Text(
                "سيتم انهاء اشتراك بعد ٣ ايام الرجاء قم باعادة الاشتراك لعدم حصول اي توقف في الانترنت",
                style: TextStyle(color: Color(0xFF7C758A)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
