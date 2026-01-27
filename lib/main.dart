import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

const Color primaryColor = Color(0xff8E60F6);
const Color whiteColor = Color(0xffffffff);
const Color blackColor = Color(0xff000000);
const Color greyColor = Color(0xff8E60F6);
const Color blueGreyColor = Color(0xff8E60F6);


void main() {
  runApp(const PrivacyPolicyApp());
}

class PrivacyPolicyApp extends StatelessWidget {
  const PrivacyPolicyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blockify Privacy Policy',
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: whiteColor,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const SplashLoader(),
        );
      },
    );
  }
}

class SplashLoader extends StatefulWidget {
  const SplashLoader({super.key});

  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> {
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loaded
        ? PrivacyPolicyPage()
        : Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: blackColor.withOpacity(0.1)),
        ),
        Center(
          child: Lottie.asset('assets/animation/lock.json', width: 210.w, height: 210.h),
        ),
      ],
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
          child: Image.asset('assets/images/logo.png', width: 15.w, height: 15.h),
        ),
        title: Text(
          'Blockify',
          style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600, color: primaryColor),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 10.w,
          interactive: true,
          radius: Radius.circular(12.r),
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(),
                  SizedBox(height: 10.h),
                  _introCard(),
                  SizedBox(height: 10.h),
                  _section(
                    icon: Icons.info_outline,
                    title: '1. Information We Collect',
                    content: [
                      _p('Blockify blocks apps and websites locally on your device. '
                          'We do NOT collect personal data unless required for core functionality.'),
                      _sub('Information You Provide'),
                      _bullet('PIN code (stored locally only)'),
                      _bullet('Blocked apps & websites (only on your device)'),
                      _sub('Automatically Processed (On Device)'),
                      _bullet('App usage events'),
                      _bullet('Accessibility & overlay events'),
                      _bullet('System blocking settings'),
                      _p('This data never leaves your device.'),
                      _sub('We do NOT collect your any information like;'),
                      _bullet('Name, email, phone'),
                      _bullet('Photos/Videos, contacts, location'),
                      _bullet('Payments or device identifiers (IMEI, serial number, etc.)'),
                    ],
                  ),
                  _section(
                    icon: Icons.lock_outline,
                    title: '2. Permissions We Use & Why',
                    content: [
                      _bullet('Usage Access – Detect blocked apps / Apply app restrictions'),
                      _bullet('Accessibility – Enforce blocking / Handle scheduled restrictions / Show warning / Overlay screens'),
                      _bullet('Overlay – Show block screens / Notify you when an app or website is blocked'),
                      _bullet('Device Admin – Prevent uninstall / Prevent app unblocking'),
                      _p('No data is collected or shared.'),
                    ],
                  ),
                  _section(
                    icon: Icons.storage_outlined,
                    title: '3. Data Storage & Security',
                    content: [
                      _bullet('All data stored locally'),
                      _bullet('No cloud servers'),
                      _bullet('Data deleted on uninstall'),
                    ],
                  ),
                  _section(
                    icon: Icons.share,
                    title: '4. Data Sharing & Third Parties',
                    content: [
                      _bullet('No third-party SDKs'),
                      _bullet('No analytics & data sharing'),
                      _bullet('No ads'),
                      _p('Your data stays with you only.'),
                    ],
                  ),
                  _section(
                    icon: Icons.child_care_outlined,
                    title: '5. Children’s Privacy',
                    content: [
                      _p('Blockify is not intended for children under 13. ''No data from children is collected.'),
                    ],
                  ),
                  _section(
                    icon: Icons.credit_card_outlined,
                    title: '6. Premium / In-App Purchases',
                    content: [
                      _p('Payments (if offered) are handled securely by Google Play Billing. ''We do not store payment details.'),
                    ],
                  ),
                  _section(
                    icon: Icons.settings_outlined,
                    title: '7. Your Rights & Controls',
                    content: [
                      _bullet('Manage permissions'),
                      _bullet('Edit or delete blocks'),
                      _bullet('Reset PIN'),
                      _bullet('Reset app restrictions / Stop the blocker'),
                      _bullet('Uninstall anytime'),
                    ],
                  ),
                  _section(
                    icon: Icons.email_outlined,
                    title: '8. Contact',
                    content: [
                      _p('Email: saaddeveloper99@gmail.com'),
                      _p('App Name: Blockify'),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    width: double.infinity,
                    color: greyColor,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    alignment: Alignment.center,
                    child: Text(
                      '© 2026 Blockify · All rights reserved',
                      style: GoogleFonts.poppins(fontSize: 12.sp, color: whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Privacy Policy',
        style: GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w700, color: blackColor),
      ),
      SizedBox(height: 6.h),
      Text(
        'Last updated · January 2026',
        style: GoogleFonts.poppins(fontSize: 14.sp, color: greyColor),
      ),
      SizedBox(height: 24.h),
    ],
  );

  Widget _introCard() => _card(
    child: _p(
      'Blockify is committed to protecting your privacy. ''All blocking operations happen locally on your device.',
    ),
  );

  Widget _section({
    required IconData icon,
    required String title,
    required List<Widget> content,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: _card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 22.sp, color: greyColor),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ...content,
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child}) => AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
    padding: EdgeInsets.all(24.w),
    width: double.infinity,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          blurRadius: 12,
          color: blackColor.withOpacity(0.09),
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: child,
  );

  Widget _p(String text) => Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Text(text, style: GoogleFonts.poppins(fontSize: 15.sp, height: 1.6, color: blueGreyColor)),
  );

  Widget _sub(String text) => Padding(
    padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
    child: Text(text, style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600, color: blackColor),
    ),
  );

  Widget _bullet(String text) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, size: 18.sp, color: primaryColor),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(text, style: GoogleFonts.poppins(fontSize: 15.sp, height: 1.5)),
        ),
      ],
    ),
  );
}
