import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../UI/Screens/Account.dart';
import '../UI/Screens/Home.dart';
import '../UI/Screens/ManageOrders/manage_orders.dart';
import '../UI/Screens/Messages.dart';
import '../UI/Screens/Search.dart';
import '../Utils/Colors.dart';
import '../Utils/res.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  get menuScreenContext => null;

  @override
  _BottomnavigationState createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  PersistentTabController? _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      Home(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      Messages(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      Search(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ManageOrders(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      Account(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Res.home),
        //title: LocaleKeys.quote.tr(),
        activeColorPrimary: MyAppColors.appColor,
        title: "Home",

        inactiveColorPrimary: MyAppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Res.messageicon),
        //  title: LocaleKeys.order.tr(),
        title: "Messages",

        activeColorPrimary: MyAppColors.appColor,
        inactiveColorPrimary: MyAppColors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Res.searchicon),
        //  title: LocaleKeys.profile.tr(),
        activeColorPrimary: MyAppColors.appColor,
        inactiveColorPrimary: MyAppColors.grey,
        title: "Search",
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Res.noteicon),
        // title:LocaleKeys.more.tr(),
        activeColorPrimary: MyAppColors.appColor,
        inactiveColorPrimary: MyAppColors.grey,
        title: "Orders",
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Res.personicon),
        // title:LocaleKeys.more.tr(),
        activeColorPrimary: MyAppColors.appColor,
        inactiveColorPrimary: MyAppColors.grey,
        title: "Account",
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return Stack(
      children: [
        PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),

          confineInSafeArea: true,

          backgroundColor: Colors.white,
          // Default is Colors.white.
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true,
          // Default is true.
          hideNavigationBarWhenKeyboardShows: true,
          // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: const NavBarDecoration(
            // boxShadow: Colors.black,
            //   borderRadius: BorderRadius.circular(20.0),
            colorBehindNavBar: Colors.black,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarHeight: 70,
          navBarStyle: NavBarStyle.style3, //
        ),
      ],
    );
  }
}
