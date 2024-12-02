import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_conference/screen/delegates_section/bank_details/bank_details.dart';
import 'package:smart_conference/screen/delegates_section/nab_bar/delegates_category_page.dart';
import 'package:smart_conference/screen/delegates_section/nab_bar/fee_delegates/fee_page.dart';
import 'package:smart_conference/screen/delegates_section/nab_bar/my_conference.dart';
import 'package:smart_conference/screen/delegates_section/nab_bar/fee_delegates/pay_registaration_fee.dart';
import 'package:smart_conference/screen/guest_flow/side_menu_navbar.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/commonFunction.dart';
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
    {"title": "Bank Data", "icon": Icons.account_balance},
  ];

  // Pages corresponding to each nav item
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const MyConferencePage();
      case 1:
        return const DelegatesCategoryPage();
      case 2:
        return const FeePage();
      case 3:
        return const BankDetailsPage();
      default:
        return const MyConferencePage();
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
      child: BottomNavigationBar(
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
    final screenWidth = MediaQuery.of(context).size.width;

    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;
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

        actions:_selectedIndex==2 ? [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: (displayType == 'desktop' || displayType == 'tablet')
                  ? 70
                  : 37,
              child: ElevatedButton(
                  onPressed: () async {


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>PayRegistrationFee(bankName: '', date: '', amount: '', image: '', tnNumber: '', title: '', paymentMode: '',)
                        ),

                    );
                    //     .then((result) {
                    //   // Handle the result from the edit screen
                    //   if (result[0]) {
                    //     data.clear();
                    //     pageNo = 1;
                    //     hasMoreData = true;
                    //     totalPages = 0;
                    //     BlocProvider.of<AllRequesterBloc>(context)
                    //         .add(AddCartDetailHandler("", pageNo, pageSize));
                    //   }
                    // }
                    // );

                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Pay Register",
                    style: FTextStyle.loginBtnStyle
                        .copyWith(color: AppColors.primaryColour,fontSize: 12),
                  )),
            ),
          )
        ]:[],
      ),

      drawer: SideMenuScreen(selectedRole: widget.selectedRole),
      backgroundColor: Colors.white,

      body: _getPage(_selectedIndex),  // Dynamic page loading
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
}