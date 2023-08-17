import 'package:flutter/material.dart';
import 'package:nche/view/finder/finder.dart';
import 'package:nche/view/homepage/homepage.dart';
import 'package:nche/view/homepage/widget/bottomsheetbutton.dart';
import 'package:nche/view/wallet/wallet.dart';
import 'package:nche/widget/colors.dart';

import '../sos/sos_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  //bool isSelected = false;

  static const List<Widget> _bodyView = <Widget>[
    HomePage(),
    WalletScreen(),
    SosScreen(),
    Center(),
    Finder(),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  final List<String> _labels = ['Home', 'Wallet', 'Live', 'Finder'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 10,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                backgroundColor: AppColor.red,
                isExtended: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'assets/home_icon.png',
                  height: 26,
                  width: 26,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: _bodyView.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: AppColor.white,
              child: TabBar(
                  onTap: (x) {
                    setState(() {
                      _selectedIndex = x;
                    });
                  },
                  labelColor: AppColor.primaryColor,
                  unselectedLabelColor:
                      AppColor.lightBlack, // const Color(0xFFC4C4C4),

                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide.none,
                  ),
                  tabs: [
                    // Home icon
                    ButtomSheetButton(
                      imageUrl: _selectedIndex == 0
                          ? 'assets/darkhome.png'
                          : 'assets/home.png',
                      indicatorColor: _selectedIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.lightBlack,
                      label: _labels[0],
                    ),

                    /// Wallet Icon
                    ButtomSheetButton(
                      imageUrl: _selectedIndex == 1
                          ? 'assets/open-wallet.png'
                          : 'assets/wallet.png',
                      indicatorColor: _selectedIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.lightBlack,
                      label: _labels[1],
                    ),
                    const Text(''),

                    /// Shop icon
                    ButtomSheetButton(
                      imageUrl: _selectedIndex == 3
                          ? 'assets/darkhome.png'
                          : 'assets/home.png',
                      indicatorColor: _selectedIndex == 3
                          ? AppColor.primaryColor
                          : AppColor.lightBlack,
                      label: _labels[2],
                    ),

                    /// User icon
                    ButtomSheetButton(
                      imageUrl: _selectedIndex == 4
                          ? 'assets/user-search.png'
                          : 'assets/user-search.png',
                      indicatorColor: _selectedIndex == 4
                          ? AppColor.primaryColor
                          : AppColor.lightBlack,
                      label: _labels[3],
                    ),
                  ],
                  controller: _tabController),
            ),
          ),
        ),
      ),
    );
  }
}
