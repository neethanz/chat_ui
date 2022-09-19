class Chat {
  final String message;
  final bool isOnline;
  final String date;
  final String sender;
  final String profileUrl;

  Chat(
      {required this.sender,
      required this.message,
      required this.date,
      required this.isOnline,
      required this.profileUrl});
}
