import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/utils/colors.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:expense_xpress/widgets/global/animate.dart';
import 'package:expense_xpress/widgets/global/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return _buildOnBoardingScreen(context, _pageController, _currentPage,
        (index) {
      setState(() {
        _currentPage = index;
      });
    });
  }
}

Widget _buildOnBoardingScreen(
    context, pageController, currentPage, Function onPageChanged) {
  return Scaffold(
    backgroundColor: AppColors.background,
    body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(children: [
          Expanded(
              child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    onPageChanged.call(index);
                  },
                  children: [
                _buildOnboardingItem(
                    S.of(context).onBoardingTitle1,
                    S.of(context).onBoardingDescription1,
                    ImagesAsset.onboarding1),
                _buildOnboardingItem(
                    S.of(context).onBoardingTitle2,
                    S.of(context).onBoardingDescription2,
                    ImagesAsset.onboarding2),
                _buildOnboardingItem(
                    S.of(context).onBoardingTitle3,
                    S.of(context).onBoardingDescription3,
                    ImagesAsset.onboarding3),
              ])),
          const SizedBox(height: 16),
          _buildIndicator(currentPage, Constants.maxBoardingScreen),
          const SizedBox(height: 16),
          _buildButtons(context),
        ])),
  );
}

Widget _buildOnboardingItem(title, subtitle, image) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(image),
      const SizedBox(height: 16),
      Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.h1.copyWith(
            // fontWeight: FontWeight.w700,
            ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          subtitle,
          style: AppStyles.h4.copyWith(
              fontWeight: FontWeight.w400, color: const Color(0xFF91919F)),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

Widget _buildButtons(context) {
  return Column(
    children: <Widget>[
      SizedBox(
          width: double.infinity,
          child: Buttons.primary(
              child: Text(
                S.of(context).signUp,
                style: AppStyles.h3.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {})),
      const SizedBox(height: 16),
      SizedBox(
          width: double.infinity,
          child: Buttons.secondary(
              child: Text(
                S.of(context).signIn,
                style: AppStyles.h3.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {})),
    ],
  );
}

Widget _buildIndicator(currentPage, totalPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(totalPage, (index) {
      bool isSelected = currentPage == index;
      double size = isSelected
          ? AppStyles.indicatorSelectedSize
          : AppStyles.indicatorSelectedSize / 2;
      return AppAnimate(
        duration: const Duration(milliseconds: 300),
      ).fade(
          child: Container(
        width: size,
        height: size,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: currentPage == index ? AppColors.primary : Colors.grey,
          borderRadius: isSelected
              ? BorderRadius.circular(size)
              : BorderRadius.circular(size / 2),
        ),
      ));
    }),
  );
}
