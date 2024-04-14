import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/styles.dart';

/// Profile/account drawer.
class Profile extends StatelessWidget {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    Widget avatar() {
      return Container(
        width: 120,
        height: 120,
        margin: const EdgeInsets.only(
          top: 5,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffdddddd),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xffcccccc),
            width: 1,
          ),
        ),
        child: ClipOval(
          child: SvgPicture.asset(
            'assets/images/user-avatar.svg',
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    Widget heading() {
      return Text(
        'My Account',
        style: Theme.of(context)
          .textTheme
          .bodyLarge,
      );
    }

    Widget close() {
      return IconButton(
        icon: const Icon(Icons.close),
        iconSize: AppFontSizes.closeButton,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    return Drawer(
      backgroundColor: AppColors.lightGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppInsets.horizontal,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: close(),
                  ),
                  avatar(),
                ],
              ),
              heading(),
            ],
          ),
        ),
      ),
    );
  }
}
