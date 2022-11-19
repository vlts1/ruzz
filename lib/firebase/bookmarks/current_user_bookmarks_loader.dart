import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/current_user_info.dart';

class CurrentUserBookmarksLoader {
  Future<QuerySnapshot<Map<String, dynamic>>> userBookmarks(BuildContext context) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<CurrentUserInfo>(context, listen: false).docId)
        .collection('bookmarks')
        .orderBy("bookmarked_on", descending: true)
        .get();
  }
}
