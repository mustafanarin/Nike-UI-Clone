import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/navbar/navbar_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/model/notification_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

final class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  final List<NotificationModel> _recentNotications = [
    NotificationModel(
        message: "We Have New Products With Offers",
        realPrice: 364.95,
        cutPrice: 260.00,
        imagePath: PngGeneralPath.shoe3.path,
        timing: "7 min ago"),
    NotificationModel(
        message: "We Have New Products With Offers",
        realPrice: 364.95,
        cutPrice: 260.00,
        imagePath: PngGeneralPath.shoe2.path,
        timing: "40 min ago")
  ];

  final List<NotificationModel> _yesterdayNotications = [
    NotificationModel(
        message: "We Have New Products With Offers",
        realPrice: 364.95,
        cutPrice: 260.00,
        imagePath: PngGeneralPath.shoe4.path,
        timing: "40 min ago"),
    NotificationModel(
        message: "We Have New Products With Offers",
        realPrice: 364.95,
        cutPrice: 260.00,
        imagePath: PngGeneralPath.shoe1.path,
        timing: "40 min ago")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: const _CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NotificationsContaianerList(
              notificationTitle: ProjectStrings.recent,
              notifications: _recentNotications,
            ),
            _NotificationsContaianerList(
              notificationTitle: ProjectStrings.yesterday,
              notifications: _yesterdayNotications,
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.cultured,
      title:  Text(ProjectStrings.notification),
      leading: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      actions: [
        Container(
            decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline_outlined))),
        SizedBox(width: 16.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NotificationsContaianerList extends StatelessWidget {
  const _NotificationsContaianerList({
    required this.notifications,
    required this.notificationTitle,
  });
  final String notificationTitle;
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationTitle,
            style: context.textTheme().titleMedium,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Row(
                    children: [
                      _NotificationImage(imagePath: notification.imagePath),
                      _NotificationInfosColumn(notification: notification),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _NotificationImage extends StatelessWidget {
  const _NotificationImage({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: ProjectColors.white, borderRadius: BorderRadius.circular(16)),
        child: Image.asset(
          height: 100.h,
          width: 100.w,
          imagePath,
          fit: BoxFit.contain,
        ));
  }
}

class _NotificationInfosColumn extends StatelessWidget {
  const _NotificationInfosColumn({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                notification.timing,
                style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.auroMetal),
              ),
            ],
          ),
          SizedBox(
            width: 150.w,
            child: Column(
              children: [
                Text(
                  notification.message,
                  style: context.textTheme().bodyLarge?.copyWith(
                        color: ProjectColors.brandeisBlue,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${notification.realPrice}",
                      style: context.textTheme().bodyLarge,
                    ),
                    Text(
                      "\$${notification.cutPrice}",
                      style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.auroMetal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
