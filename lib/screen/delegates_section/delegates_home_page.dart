import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_conference/screen/delegates_section/bank_details.dart';
import 'package:smart_conference/screen/delegates_section/delegates_category_page.dart';
import 'package:smart_conference/screen/delegates_section/fee_page.dart';
import 'package:smart_conference/screen/delegates_section/my_conference.dart';
import 'package:smart_conference/screen/guest_flow/side_menu_navbar.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/flutter_flow_animations.dart';
import 'package:smart_conference/utils/font_text_Style.dart';

class HomeDelegates extends StatefulWidget {
  final String selectedRole;
  const HomeDelegates({required this.selectedRole,super.key});

  @override
  State<HomeDelegates> createState() => _HomeDelegatesState();
}

class _HomeDelegatesState extends State<HomeDelegates> {
  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navBarItems = [
    {"title": "My Conference", "icon": Icons.event},
    {"title": "Delegates", "icon": Icons.people},
    {"title": "Fee", "icon": Icons.attach_money},
    {"title": "Bank Details", "icon": Icons.account_balance},
  ];

  // Pages corresponding to each nav item
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MyConferencePage();
      case 1:
        return DelegatesCategoryPage();
      case 2:
        return FeePage();
      case 3:
        return BankDetailsPage();
      default:
        return MyConferencePage();
    }
  }

  // Update selected index when nav item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ), // Menu icon
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the drawer
          },
        ),
        title:Text(
          _navBarItems[_selectedIndex]['title'],
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      drawer: SideMenuScreen(selectedRole: widget.selectedRole),
      backgroundColor: Colors.white,

      body: _getPage(_selectedIndex),  // Dynamic page loading
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarItems
            .map(
              (item) => BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _selectedIndex == _navBarItems.indexOf(item)
                    ?AppColors.primaryColour.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                item['icon'],
                size: 30,
                color: _selectedIndex == _navBarItems.indexOf(item)
                    ?AppColors.primaryColour
                    : Colors.grey,
              ),
            ),
            label: item['title'],
          ),
        )
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColour,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 8,
      ),
    );
  }
}