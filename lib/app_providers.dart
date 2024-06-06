import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:spaceknowledge/providers/home_provider.dart';
import 'package:spaceknowledge/providers/index_provider.dart';
import 'package:spaceknowledge/providers/search_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => IndexProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    ),
  ];
}
