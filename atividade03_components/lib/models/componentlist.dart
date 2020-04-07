import 'package:flutter/material.dart';
import 'component_detail.dart';

mixin ComponentList {
  String title;

  List<ComponentDetail> getComponents(BuildContext context);
}
