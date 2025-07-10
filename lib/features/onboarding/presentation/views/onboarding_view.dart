import 'package:flutter/material.dart';
import 'package:insight_med/core/utls/app_color.dart';
import 'package:insight_med/features/onboarding/presentation/views/widgets/onboarding_avatar_image.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
 static const routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: (){

                          },
                           child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(AppColors.lightGray),
                            ),
                           )),
                      ),
                      OnboardingAvatarImage(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text('Care for Clinicians',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(AppColors.black),
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  45.0),
                        child: Text(
                          'The app caters to both medical professionals and patients, teasing the specific benefits for each.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            
                            fontSize: 16,
                            color: Color(AppColors.lightGray),
                          ),
                        ),
                      )
                  
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
