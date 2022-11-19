import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/home_page/updates_page/updates_page.dart';
import 'package:ruzz/pages/jump_to_top/single_page_top_jumper.dart';
import 'package:ruzz/pages/loading_screen/loading_screen.dart';
import 'package:ruzz/pages/search_page/updates_search.dart';
import 'package:ruzz/pages/user_profile/user_profile.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/themes/icons/home_page/home_page_icon.dart';
import 'package:ruzz/themes/icons/profile/profile_icon.dart';
import 'package:ruzz/themes/icons/search_page/search_icon.dart';
import '../providers/search_provider.dart';
import '../startup_data_collector.dart';
import 'no_network_popup.dart';
import 'registration_page/registration_page.dart';

class PagesScaffold extends StatefulWidget {
  const PagesScaffold({Key? key}) : super(key: key);
  static const route = '/';
  /// Update widgets need it, as they do not have a persisting context.
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<PagesScaffold> createState() => _PagesScaffoldState();
}

class _PagesScaffoldState extends State<PagesScaffold> {
  late CurrentUserInfo currentUserInfo;
  late SearchProvider  searchProvider;

  static final updatesPageTopJumper = SinglePageTopJumper();
  static final searchPageTopJumper  = SinglePageTopJumper();

  static const searchPageScaffoldIndex  = 0;
  static const mainPageScaffoldIndex    = 1;
  static const profilePageScaffoldIndex = 2;

  int currentIndex = mainPageScaffoldIndex;
  
  final startupDataCollector = StartupDataCollector();
  final noNetworkPopup       = NoNetworkPopup();

  @override
  void didChangeDependencies() {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
    searchProvider  = Provider.of<SearchProvider>(context);
    super.didChangeDependencies();
  }

  void onTap(int newIndex) {
    if (currentIndex == searchPageScaffoldIndex) {
      if (newIndex == searchPageScaffoldIndex) {
        if (searchProvider.areSearchResultsVisible) {
          searchProvider.closeSearchResults();
        } else {
          searchPageTopJumper.goToTop();
        }
      }
    } 
    else if (currentIndex == mainPageScaffoldIndex) {
      if (newIndex == mainPageScaffoldIndex) {
        updatesPageTopJumper.goToTop();
      }
    } 
    else if (currentIndex == profilePageScaffoldIndex) {
      if (newIndex == profilePageScaffoldIndex) {
        updatesPageTopJumper.goToTop();
      }
    }
    setState(() { 
      currentIndex = newIndex;
    });
  }

  Widget tabPageSelector(BuildContext context, int index) {
    switch (index) {
      case searchPageScaffoldIndex:
        return UpdatesSearch(scrollController: searchPageTopJumper .listController);
      case mainPageScaffoldIndex:
        return UpdatesPage  (scrollController: updatesPageTopJumper.listController);
      case profilePageScaffoldIndex:
        return const UserProfile();
      default:
        return UpdatesPage  (scrollController: updatesPageTopJumper.listController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        key: PagesScaffold.scaffoldKey,
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return RegistrationPage();

          else if (currentUserInfo.isInitialized() == false) {
            debugPrint('return loading screen');
            startupDataCollector.loadStartupData(context)
              .then   ((_) => setState(() {}))
              .onError((error, stack) => 
                noNetworkPopup.showPopup(context, () { setState(() {}); })
              );
            return LoadingScreen();
          }
          
          return Platform.isIOS
              ? CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    onTap: onTap,
                    currentIndex: currentIndex,
                    items: const [
                      BottomNavigationBarItem(icon: SearchIcon  (), label: "Search" ),
                      BottomNavigationBarItem(icon: HomePageIcon(), label: "Latest" ),
                      BottomNavigationBarItem(icon: ProfileIcon (), label: "Profile"),
                    ],
                  ),
                  tabBuilder: tabPageSelector,
                )
              : Scaffold(
                  bottomNavigationBar: NavigationBar(
                    onDestinationSelected: onTap,
                    selectedIndex: currentIndex,
                    destinations: const [
                      NavigationDestination(icon: SearchIcon  (), label: 'Search' ),
                      NavigationDestination(icon: HomePageIcon(), label: 'Latest' ),
                      NavigationDestination(icon: ProfileIcon (), label: 'Profile'),
                    ],
                  ),
                  body: tabPageSelector(context, currentIndex),
                );
        });
  }
}