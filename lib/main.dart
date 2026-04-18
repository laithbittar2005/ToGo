import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ضفنا مكتبة البلوك
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:togo/core/theme/app_colors.dart'; // ملف الألوان تبعك
import 'package:togo/core/theme/theme_cubit.dart';
import 'package:togo/features/booking/presentation/screens/main_screen.dart';

void main() {
  runApp(const ToGoApp());
}

class ToGoApp extends StatelessWidget {
  const ToGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // تعريف الثيم كيوبيت ليكون متاحاً لكل التطبيق
        BlocProvider(create: (context) => ThemeCubit()),
        // فيك تضيف باقي البلوكات هون مستقبلاً:
        // BlocProvider(create: (context) => SearchBloc()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // البناء بناءً على حالة الثيم 
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        
        AppColors.isDarkMode = isDark;

        return MaterialApp(
          key: ValueKey(isDark), 
          debugShowCheckedModeBanner: false,
          title: 'ToGo',

          locale: const Locale('ar', 'AE'),
          supportedLocales: const [Locale('ar', 'AE')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // --- إعدادات الثيم  ---
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          
          theme: ThemeData(
            fontFamily: 'Cairo',
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.scaffoldBg, 
          ),

          darkTheme: ThemeData(
            fontFamily: 'Cairo',
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.scaffoldBg, 
          ),

          home: const MainScreen(),
        );
      },
    );
  }
}