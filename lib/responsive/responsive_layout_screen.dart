import 'package:flutter/material.dart';
import 'package:flutter_insta/providers/user_provider.dart';
import 'package:flutter_insta/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  void addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreenLayout;
        } else {
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
