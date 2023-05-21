import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/view/widgets/custom_text.dart';

import '../core/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>();
  }
}
