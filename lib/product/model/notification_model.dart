class NotificationModel {
  final String message;
  final double realPrice;
  final double cutPrice;
  final String imagePath;
  final String timing;

  NotificationModel(
      {required this.message,
      required this.realPrice,
      required this.cutPrice,
      required this.imagePath,
      required this.timing});
}
