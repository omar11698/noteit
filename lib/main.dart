import 'package:flutter/material.dart';
import 'package:noteit/Note_feature/presentation/manager/providers/font_icon_provider.dart';
import 'package:noteit/core/config/themes/app_themes.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';
import 'Note_feature/presentation/manager/providers/color_showmodal_provider.dart';
import 'core/config/multi_bloc_provider/MultiBlocProvidersList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/config/firebase_options/firebase_options.dart';
import 'core/config/bloc_observer/bloc_observer.dart';
import 'core/config/router/navigation_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/themes/theme_provider.dart';
import 'core/config/dependency_injection/DI.dart' as di;

void main() async {
  // await   await intiAppModule();
  await di.initAppModule();
  Bloc.observer = MyGlobalObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.initNoteModule();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MultiBlocProvidersList.blocProvidersList(context),
        child: ChangeNotifierProvider(
          create: (BuildContext context) =>
              ShowColorBottomModalProvider(colorSelected: Colors.white),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => FontButtonProvider(
                isToolBoxVisible: false, selectedFont: MyGoogleFonts.abel),
            child: Consumer<ThemeProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return MaterialApp(
                  title: 'NoteIt',
                  debugShowCheckedModeBanner: false,
                  theme: value.isThemeChanged ? AppTheme.dark : AppTheme.light,
                  onGenerateRoute: NavigationRouter.generateRoute,
                  initialRoute: loginRoute,

                  // ),
                );
              },
            ),
          ),
        ));
  }
}
