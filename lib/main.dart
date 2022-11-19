import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/conversations_page.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/full_page_conversation.dart';
import 'package:ruzz/pages/home_page/bookmarks_page.dart';
import 'package:ruzz/pages/home_page/tracked_page/tracked_page.dart';
import 'package:ruzz/pages/pages_scaffold.dart';
import 'package:ruzz/pages/registration_page/registration_page.dart';
import 'package:ruzz/pages/technology_releases_page/technology_releases_page.dart';
import 'package:ruzz/pages/user_profile/user_profile.dart';
import 'package:ruzz/providers/bookmarks.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/comments/old_new_conversations_separation.dart';
import 'package:ruzz/providers/editing_profile.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import 'package:ruzz/providers/profile_images_provider.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import 'package:ruzz/providers/replies/replies_loading_status.dart';
import 'package:ruzz/providers/replies/replies_visibility.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/editing_comment.dart';
import 'package:ruzz/providers/search_provider.dart';
import 'package:ruzz/update_widgets/full_page_update/full_page_update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/comments/comment_preview_positions.dart';
import 'package:ruzz/providers/comments/updates_last_loaded_comment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.instance.requestPermission(
    alert:         true,
    sound:         true,
    badge:         true,
    announcement:  false,
    carPlay:       false,
    criticalAlert: false,
    provisional:   false,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    PagesScaffold         .route: (context) => const PagesScaffold(),
    BookmarksPage         .route: (context) => const BookmarksPage(),
    TrackedPage           .route: (context) => const TrackedPage(),
    UserProfile           .route: (context) => const UserProfile(),
    FullPageUpdate        .route: (context) => const FullPageUpdate(),
    TechnologyReleasesPage.route: (context) => const TechnologyReleasesPage(),
    ConversationsPage     .route: (context) => const ConversationsPage(),
    FullPageConversation  .route: (context) => const FullPageConversation(),
    RegistrationPage      .route: (context) =>       RegistrationPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CurrentUserInfo>              (create: (_)   => CurrentUserInfo()),
          ChangeNotifierProvider<EditingComment>               (create: (_)   => EditingComment()),
          ChangeNotifierProvider<CommentsLoadingStatus>        (create: (_)   => CommentsLoadingStatus()),
          ChangeNotifierProvider<LoadedComments>               (create: (_)   => LoadedComments()),
          ChangeNotifierProvider<RepliesLoadingStatus>         (create: (_)   => RepliesLoadingStatus()),
          ChangeNotifierProvider<RepliesVisibility>            (create: (_)   => RepliesVisibility()),
          ChangeNotifierProvider<LoadedReplies>                (create: (_)   => LoadedReplies()),
          ChangeNotifierProvider<LatestTechnologyVersions>     (create: (_)   => LatestTechnologyVersions()),
          ChangeNotifierProvider<EditingProfile>               (create: (_)   => EditingProfile()),
          ChangeNotifierProvider<Bookmarks>                    (create: (ctx) => Bookmarks(ctx)),
          ChangeNotifierProvider<SearchProvider>               (create: (_)   => SearchProvider()),
          ChangeNotifierProvider<OldNewConversationsSeparation>(create: (_)   => OldNewConversationsSeparation()),
          ChangeNotifierProvider<CommentPreviewPositions>      (create: (_)   => CommentPreviewPositions()),
                        Provider<UpdatesLastLoadedComment>     (create: (_)   => UpdatesLastLoadedComment()),
                        Provider<ProfileImagesProvider>        (create: (_)   => ProfileImagesProvider()),
        ],
        child: Platform.isIOS
            ? CupertinoApp(
                title: 'Ruzz',
                initialRoute: PagesScaffold.route,
                routes: routes,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  DefaultMaterialLocalizations .delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations  .delegate,
                ],
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
                title: 'Ruzz',
                theme: ThemeData().copyWith(useMaterial3: true),
                initialRoute: PagesScaffold.route,
                routes: routes,
              ));
  }
}
