import 'package:flutter/cupertino.dart';

abstract class IUserPublicInfo {
  Image    get logo;
  String   get fullName;
  DateTime get joinDate;
}
