import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:ruzz/firebase/users/i_user_public_info.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/profile_images_provider.dart';

class UserPublicInfo implements IUserPublicInfo {
  UserPublicInfo({
    required this.logo,
    required this.fullName,
    required this.joinDate,
  });

  @override
  final Image    logo;
  @override
  final String   fullName;
  @override
  final DateTime joinDate;

  factory UserPublicInfo.fromComment(
    DocumentSnapshot      doc, 
    CurrentUserInfo       currentUserInfo,
    ProfileImagesProvider profileImagesProvider,
  ) {
    final userRef = doc.get('user_id') as DocumentReference;
    final userId  = userRef.id;

    if (userId == currentUserInfo.docId) {
      return UserPublicInfo(
        logo:     currentUserInfo.logo, 
        fullName: currentUserInfo.fullName, 
        joinDate: currentUserInfo.joinDate,
      );
    }
    final Image? providerLogo = profileImagesProvider.getUserLogo(userId);
    
    late final Image logo;
    if (providerLogo != null) {
      debugPrint('UserPublicInfo: got logo from provider');
      logo = providerLogo;
    }

    else {
      //! Code hidden in open source due to security reasons  
    }

    return UserPublicInfo(
      logo: logo,
      fullName: doc.get("user_name"),
      joinDate: DateTime.fromMicrosecondsSinceEpoch(
        doc.get("user_join_date").microsecondsSinceEpoch,
      ),
    );
  }
}
