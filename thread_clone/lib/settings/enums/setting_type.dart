import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SettingType {
  followAndInviteFriends(
    iconData: FontAwesomeIcons.userPlus,
    data: 'Follow and invite friends',
  ),
  notifications(
    iconData: FontAwesomeIcons.bell,
    data: 'Notifications',
  ),
  privacy(
    iconData: FontAwesomeIcons.lock,
    data: 'Privacy',
  ),
  account(
    iconData: FontAwesomeIcons.circleUser,
    data: 'Account',
  ),
  help(
    iconData: FontAwesomeIcons.lifeRing,
    data: 'Help',
  ),
  about(
    iconData: FontAwesomeIcons.circleInfo,
    data: 'About',
  ),
  ;

  const SettingType({required this.iconData, required this.data});

  final IconData iconData;
  final String data;
}
