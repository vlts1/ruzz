import 'package:flutter/material.dart';
import 'package:ruzz/firebase/comments/conversation_forgetter.dart';
import 'package:ruzz/firebase/comments/conversation_joiner.dart';
import 'package:ruzz/firebase/profile/replies_checked_date_updater.dart';
import 'package:ruzz/firebase/releases/technology_releases.dart';
import 'package:ruzz/firebase/user_subscriptions/technology_tracker.dart';
import 'package:ruzz/firebase/user_subscriptions/technology_tracking_remover.dart';
import 'package:ruzz/firebase/user_subscriptions/topic_subscriber.dart';
import 'package:ruzz/firebase/user_subscriptions/topic_unsubscriber.dart';
import 'package:ruzz/firebase/users/i_user_doc.dart';
import 'package:ruzz/local_db/ruzz_db.dart';
import '../firebase/users/i_user_public_info.dart';

class CurrentUserInfo extends ChangeNotifier implements IUserDoc, IUserPublicInfo {
  final _topicSubscriber           = TopicSubscriber          ();
  final _topicUnsubscriber         = TopicUnsubscriber        ();
  final _technologyTracker         = TechnologyTracker        ();
  final _trackingRemover           = TechnologyTrackingRemover();
  final _technologyReleases        = TechnologyReleases       ();
  final _conversationJoinder       = ConversationJoiner       ();
  final _conversationForgetter     = ConversationForgetter    ();
  final _repliesCheckedDateUpdater = RepliesCheckedDateUpdater();

  Image    _logo     = Image.asset('images/def-icon-blue.png');
  String   _name     = "";
  String   _docId    = "";
  DateTime _joinDate = DateTime.now();
  DateTime _lastCheckedConversationsOn = DateTime.now();

  List<String> _myTechnologies  = [];
  List<String> _myConversations = [];

  bool isInitialized() => _name.isNotEmpty && _docId.isNotEmpty;

  void setNotInitiated() {
    _logo     = Image.asset('images/def-icon-blue.png');
    _name     = "";
    _docId    = "";
    _joinDate = DateTime.now();
    _lastCheckedConversationsOn = DateTime.now();
  }

  void initiateFields(
    Image        logo,
    String       name,
    String       docId,
    DateTime     joinDate,
    DateTime     lastCheckedConversationsOn,
    List<String> myTechnologies,
    List<String> myConversations
  ) {
    if (isInitialized() == false) {
      _logo                       = logo;
      _name                       = name;
      _docId                      = docId;
      _joinDate                   = joinDate;
      _lastCheckedConversationsOn = lastCheckedConversationsOn;
      _myTechnologies             = myTechnologies;
      _myConversations            = myConversations;
      debugPrint('initialized fields');

      myTechnologies.forEach((technology) { 
        _topicSubscriber.subscribeToTechnologyNotifications(technology);
      });
    }
  }

  @override
  String       get docId          => _docId;

  @override
  String       get fullName       => _name;

  @override
  DateTime     get joinDate       => _joinDate;

  @override
  List<String> get myTechnologies => _myTechnologies;

  @override
  DateTime     get checkedConversationsOn => _lastCheckedConversationsOn;

  @override
  Image get logo => _logo;
  
  set logo(Image image) {
    _logo = image;
    notifyListeners();
  }

  set fullName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateLastCheckedConversationsOn(DateTime date) {
    if (this._lastCheckedConversationsOn.isAtSameMomentAs(date)) return;
    this._lastCheckedConversationsOn = date;
    _repliesCheckedDateUpdater.updateDate(_lastCheckedConversationsOn, docId);
    notifyListeners();
  }

  void subscribeToTechnology(String technology) {
    if (myTechnologies.contains(technology) == false) {
      _topicSubscriber.subscribeToTechnologyNotifications(technology);
      _myTechnologies.add(technology);

      _technologyReleases.fetchAllReleases(technology).then((releases) {
          RuzzDb.instance.addAllReleases(releases);
          debugPrint('fetched $technology releases, lenght: ' + releases.length.toString());
        }
      );

      _technologyTracker.trackTechnology(technology, docId);
      notifyListeners();

      debugPrint('subscribed to $technology') ;
    }
  }

  void unsubscribeFromTechnology(String technology) {
    _topicUnsubscriber.unsubscribeFromTechnologyNotifications(technology);
    _myTechnologies .remove(technology);
    RuzzDb.instance .removeAllReleases([technology]);
    _trackingRemover.stopTrackingTechnology(technology, docId);
    notifyListeners();

    debugPrint('unsubscribed from $technology');
  }

  @override
  List<String> get myConversations => _myConversations;

  Future<void> joinConversation(String commentReference) async {
    if (_myConversations.contains(commentReference)) {
      debugPrint('CurrentUserInfo: myConversations already include $commentReference');
      return;
    }
    if (_myConversations.length > 500) {
      final lastElement = _myConversations.removeLast();
      _conversationForgetter.forgetConversation(docId, lastElement);
    }

    _myConversations.add(commentReference);
    _conversationJoinder.joinConversation(docId, commentReference);
    notifyListeners();
  }
}
