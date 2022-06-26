import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/home/view/home_view.dart';
import 'package:word_cloud_poc/app_features/profile/view/profile_view.dart';
import 'package:word_cloud_poc/app_features/questions/view/questions_view.dart';
import 'package:word_cloud_poc/config/app_theme.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final PageController _page = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _page,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeView(),
              QuestionsView(),
              ProfileView(),
            ],
          ),
          Positioned(
            bottom: 35,
            left: 35,
            right: 35,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.cardBgColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomIcon(
                      icon: Icons.home,
                      isSelected: selectedIndex == 0,
                      onTap: () => onChange(0),
                    ),
                    BottomIcon(
                      icon: Icons.list,
                      isSelected: selectedIndex == 1,
                      onTap: () => onChange(1),
                    ),
                    BottomIcon(
                      icon: Icons.person,
                      isSelected: selectedIndex == 2,
                      onTap: () => onChange(2),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onChange(int index) {
    _page.jumpToPage(index);
    setState(() => selectedIndex = (index).toInt());
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  const BottomIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: isSelected ? Colors.green : AppTheme.background,),
    );
  }
}
