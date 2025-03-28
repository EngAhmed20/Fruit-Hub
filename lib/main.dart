import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_function/on_generate_routes.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/services/shared_prefrences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bloc_observer.dart';
import 'core/utilis/locale/app_localizations_setup.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sharedPreferences.init();
  Bloc.observer= FruitsBlocObserver();
  ServicesLoacator().init();
  await Supabase.initialize(
    url: "https://pekytshuvupspusketqt.supabase.co",
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBla3l0c2h1dnVwc3B1c2tldHF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIzNzI0NTgsImV4cCI6MjA0Nzk0ODQ1OH0.uuix3exkZlqpDZbQkgOIIJQzULc4VHHx1ijphaGOMYg',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'cairo',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
     onGenerateRoute: onGenrateRoute,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localeResolutionCallback:
      AppLocalizationsSetup.localeResolutionCallback,
      localizationsDelegates:
      AppLocalizationsSetup.localizationsDelegates,
      locale: const Locale('ar'),
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}

