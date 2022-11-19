abstract class IUserDoc {
  String   get docId;
  String   get fullName;
  DateTime get joinDate;
  List     get myTechnologies;
  List     get myConversations;
  DateTime get checkedConversationsOn;
}
