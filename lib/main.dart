import 'package:flutter/material.dart';
import 'package:muna_match/add_photo_screen.dart';
import 'package:muna_match/begin_journey_screen.dart';
import 'package:muna_match/birthday_screen.dart';
import 'package:muna_match/complete_profile_language.dart';
import 'package:muna_match/confirm_screen.dart';
import 'package:muna_match/explore_screen.dart';
import 'package:muna_match/profession_screen.dart';
import 'splash_screen.dart';
import 'sign_up_screen.dart';
import 'email_screen.dart';  // Added for routing
import 'verification_screen.dart'; 
import 'welcome_screen.dart';
import 'gender_screen.dart'; 
import 'name_screen.dart'; 
import 'about_you_screen.dart';
import 'education_screen.dart';
import 'block_contacts_screen.dart';
import 'enable_notifications_screen.dart';
import 'visited_you_screen.dart';
import 'favourited_screen.dart';
import 'user_profile_menu_screen.dart';
import 'view_prew_screen.dart';
import 'profile_edit_screen.dart';

void main() {
  runApp(const MunaMatchApp());
}

class MunaMatchApp extends StatelessWidget {
  const MunaMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muna Match',

      // Theme setup
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6F61), // Coral
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto', // Change to your desired font
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),

      // Initial screen
      home: const SplashScreen(),

      // Named routes
      routes: {
        '/email_screen': (context) => const EmailScreen(),
         '/verification': (context) => const VerificationScreen(),
          '/welcome': (context) => const WelcomeScreen(),
           '/sign-up': (context) => const SignUpScreen(),
          '/gender': (context) => const GenderScreen(),
          '/name': (context) => const NameScreen(),
            '/birthday': (context) => const BirthdayScreen(),
             '/about_you': (context) => const AboutYouScreen(),
              '/begin_journey': (context) => const BeginJourneyScreen(),
               '/profession_screen': (context) => const ProfessionScreen(),
                    '/education_screen': (context) => const EducationScreen(), 
                    '/block_contacts_screen': (context) => const BlockContactsScreen(),
                    '/enable_notifications_screen': (context) => const EnableNotificationsScreen(), 
                      '/confirm_screen': (context) => const ConfirmScreen(), 
                      '/add_photo_screen': (context) => const AddPhotoScreen(),
                      '/explore_screen': (context) => const ExploreScreen(),
                      '/visited_you_screen': (context) => const VisitedYouScreen(),
                      '/favourited_screen': (context) => const FavouritedScreen(),
                      '/user_profile_menu': (context) => const UserProfileMenu(),
                      '/view_prew_screen': (context) => const ViewPrewScreen(),
                      '/profile_edit_screen': (context) => const ProfileEditScreen(),
                      '/complete_profile_language': (context) => const CompleteProfileLanguage(), 
                    
 
                                      
      },
    );
  }
}
