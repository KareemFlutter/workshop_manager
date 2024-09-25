import 'package:flutter/material.dart';
import 'package:workshop_manager/workshop.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const WorkshopManager());
}
