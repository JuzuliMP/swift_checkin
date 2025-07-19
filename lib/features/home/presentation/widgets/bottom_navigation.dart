import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = theme.colorScheme.primary;
    final unselectedColor = theme.colorScheme.onSurface;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(color: theme.colorScheme.secondary),
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/activities.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/jobs.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
