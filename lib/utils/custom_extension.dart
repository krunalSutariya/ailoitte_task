extension StringExtension on String {

  bool get isNetworkImage =>
      toLowerCase().startsWith("http://") ||
      toLowerCase().startsWith("https://");
}
