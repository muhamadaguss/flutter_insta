import 'package:flutter/material.dart';
import 'package:flutter_insta/screens/feed_screen.dart';

import '../screens/add_post_screen.dart';

const webScreenSize = 600;

const homeScreenItem = [
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('favorite'),
  Text('profile'),
];
