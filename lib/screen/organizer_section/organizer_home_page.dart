import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/guest_flow/side_menu_navbar.dart';
import 'package:nexcon/screen/organizer_section/abstract_and_paper/abstract_organizer/abstract_organizer.dart';
import 'package:nexcon/screen/organizer_section/abstract_and_paper/paper_organizer/paper_organizer.dart';
import 'package:nexcon/screen/organizer_section/my_conference/my_conference_organizer.dart';
import 'package:nexcon/screen/organizer_section/mydashboard_organizer/my_dashboard_organizer.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/commonFunction.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class OrganizerHomePage extends StatefulWidget {
  final String selectedRole;
  const OrganizerHomePage({required this.selectedRole,super.key});

  @override
  State<OrganizerHomePage> createState() => _OrganizerHomePageState();
}

class _OrganizerHomePageState extends State<OrganizerHomePage> {
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
    {"title": "Organizer Dashboard", "icon": Icons.dashboard},
    {"title": "My Conference", "icon": Icons.event},
    {"title": "Abstract", "icon": Icons.padding_rounded},
    {"title": "Paper", "icon": Icons.book},
  ];

  // Pages corresponding to each nav item
  Widget _getPage(int index) {
    switch (index) {

      case 0:
        return const MyDashboardOrganizer();
      case 1:
        return const MyConferenceOrganizer();
      case 2:
        return const AbstractOrganizer();
      case 3:
        return const PaperOrganizer();
      default:
        return const MyDashboardOrganizer();
    }
  }

  // Update selected index when nav item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.08,
      decoration: const BoxDecoration(
        color: AppColors.primaryColour,// Use the theme's primary color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),  // Rounded top-left corner
          topRight: Radius.circular(25), // Rounded top-right corner
        ),
      ),
      child:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent, // Make the background transparent
        selectedItemColor: Colors.white, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        showUnselectedLabels: true,
        items: _navBarItems
            .map(
              (item) => BottomNavigationBarItem(
            icon: Icon(
              item['icon'],
              size: 30,
              color: _selectedIndex == _navBarItems.indexOf(item)
                  ?Colors.white
                  : Colors.grey,
            ),
            label: item['title'],
          ),
        )
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
        ), // Title of the app bar
        centerTitle: true,
      ),
      drawer: SideMenuScreen(selectedRole: widget.selectedRole),

      backgroundColor: Colors.white,
      body: _getPage(_selectedIndex),  // Dynamic page loading
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

}
