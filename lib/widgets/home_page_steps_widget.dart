import 'dart:ui';
import 'package:MaydaNozzle/constants/turkish_lang.dart';
import 'package:MaydaNozzle/services/bloc/app_page/app_page_event.dart';
import 'package:MaydaNozzle/utilities/responsive.dart';
import 'package:MaydaNozzle/widgets/app_buttons.dart';
import 'package:MaydaNozzle/widgets/scaling_image.dart';
import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

// A responsive widget.
class HomePageViewStepsWidget extends StatelessWidget {
  final ThemeData theme;

  const HomePageViewStepsWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (_, constraints) {
          double offsetX = 0;
          List<Widget> widgets;

          // Define a minWidth for each aspect ratio, below this we'll offset the content on the hz axis to center it
          double width = !Responsive.isDesktopWidth(context) ? 600 : 1200;

          if (constraints.maxWidth < width) {
            offsetX = -(width - constraints.maxWidth) / 2;
          }

          // Here lies the responsive magic.
          if (Responsive.isMobileWidth(context)) {
            widgets = [ // TODO finish image locations
              ScalingImage(
                  "mobile_lines.png",
                  const Offset(80, 0),
                  height: 900,
                  scaleOnHover: false
              ),
              Positioned(
                left: 345,
                top: 150,
                child: _howDoesItWorkWidget(
                    color: theme.colorScheme.shadow,
                    currentTheme: theme,
                    givenText: howDoesItWork,
                    givenVerticalInset: 10,
                    givenHorizontalInset: 40,
                    givenTextSize: 17,
                    givenEdgeRadius: 30
                ),
              ),
              ScalingImageV2(
                "home_page_pic_1.png",
                const Offset(30, 50),
                stageNumber: 1,
                givenHeadline: homePagePic1HeadlineTM,
                scaleWeight: 1.15,
                height: 260,
              ),
              ScalingImageV2(
                "home_page_pic_2.png",
                const Offset(255, 260),
                stageNumber: 2,
                givenHeadline: homePagePic2HeadlineTM,
                scaleWeight: 1.15,
                height: 260,
              ),
              ScalingImageV2(
                "home_page_pic_3.png",
                const Offset(30, 470),
                stageNumber: 3,
                givenHeadline: homePagePic3HeadlineTM,
                scaleWeight: 1.15,
                height: 260,
              ),
              ScalingImageV2(
                "home_page_pic_4.png",
                const Offset(255, 680),
                stageNumber: 4,
                givenHeadline: homePagePic4HeadlineTM,
                scaleWeight: 1.15,
                height: 260,
              ),
              Positioned(
                left: 95,
                top: 770,
                height: 67,
                width: 150,
                child: AppRouteBarFullButton(
                  givenEvent: const AppPageInitializeUpload(),
                  givenText: letsStart2,
                  currentTheme: theme,
                  givenVerticalInset: 10,
                  givenHorizontalInset: 20,
                  givenTextSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ];
          }
          else if (Responsive.isTabletWidth(context)) {
            if (context.widthPx < 800 ) {
              widgets = [ // TODO finish image locations
                ScalingImage(
                    "mobile_lines.png",
                    const Offset(80, 0),
                    height: 900,
                    scaleOnHover: false
                ),
                Positioned(
                  left: 390,
                  top: 150,
                  child: _howDoesItWorkWidget(
                      color: theme.colorScheme.shadow,
                      currentTheme: theme,
                      givenText: howDoesItWork,
                      givenVerticalInset: 10,
                      givenHorizontalInset: 45,
                      givenTextSize: 20,
                      givenEdgeRadius: 30
                  ),
                ),
                ScalingImageV2(
                  "home_page_pic_1.png",
                  const Offset(-40, 50),
                  stageNumber: 1,
                  givenHeadline: homePagePic1HeadlineTM,
                  scaleWeight: 1.15,
                  height: 280,
                  width: 340,
                  imageWidth: 260,
                  headlineSize: 17,
                ),
                ScalingImageV2(
                  "home_page_pic_2.png",
                  const Offset(325, 230),
                  stageNumber: 2,
                  givenHeadline: homePagePic2HeadlineTM,
                  scaleWeight: 1.15,
                  height: 280,
                  width: 340,
                  imageWidth: 260,
                  headlineSize: 17,
                ),
                ScalingImageV2(
                  "home_page_pic_3.png",
                  const Offset(-40, 420),
                  stageNumber: 3,
                  givenHeadline: homePagePic3HeadlineTM,
                  scaleWeight: 1.15,
                  height: 280,
                  width: 340,
                  imageWidth: 260,
                  headlineSize: 17,
                ),
                ScalingImageV2(
                  "home_page_pic_4.png",
                  const Offset(325, 610),
                  stageNumber: 4,
                  givenHeadline: homePagePic4HeadlineTM,
                  scaleWeight: 1.15,
                  height: 280,
                  width: 340,
                  imageWidth: 260,
                  headlineSize: 17,
                ),
                Positioned(
                  left: 40,
                  top: 730,
                  height: 67,
                  width: 150,
                  child: AppRouteBarFullButton(
                    givenEvent: const AppPageInitializeUpload(),
                    givenText: letsStart2,
                    currentTheme: theme,
                    givenVerticalInset: 10,
                    givenHorizontalInset: 20,
                    givenTextSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ];
            } else {
              widgets = [
              ScalingImage(
                "mobile_tablet_lines.png",
                const Offset(75, 60),
                height: 850,
                scaleOnHover: false,
              ),
              Positioned(
                left: 220,
                top: 80,
                child: _howDoesItWorkWidget(
                    color: theme.colorScheme.shadow,
                    currentTheme: theme,
                    givenText: howDoesItWork,
                    givenVerticalInset: 15,
                    givenHorizontalInset: 40,
                    givenTextSize: 18,
                    givenEdgeRadius: 40
                ),
              ),
              ScalingImageV2(
                "home_page_pic_1.png",
                const Offset(-100, 120),
                height: 325,
                width: 360,
                imageWidth: 290,
                headlineSize: 16,
                stageNumber: 1,
                givenHeadline: homePagePic1Headline,
                scaleWeight: 1.15,
              ),
              ScalingImageV2(
                "home_page_pic_2.png",
                const Offset(320, 130),
                height: 320,
                width: 360,
                imageWidth: 290,
                headlineSize: 16,
                stageNumber: 2,
                givenHeadline: homePagePic2Headline,
                scaleWeight: 1.15,
              ),
              ScalingImageV2(
                "home_page_pic_3.png",
                const Offset(-50, 435),
                height: 320,
                width: 360,
                imageWidth: 290,
                headlineSize: 16,
                stageNumber: 3,
                givenHeadline: homePagePic3Headline,
                scaleWeight: 1.15,
              ),
              ScalingImageV2(
                "home_page_pic_4.png",
                const Offset(340, 435),
                height: 320,
                width: 360,
                imageWidth: 290,
                headlineSize: 16,
                stageNumber: 4,
                givenHeadline: homePagePic4Headline,
                scaleWeight: 1.15,
              ),
              Positioned(
                left: 200,
                top: 800,
                child: AppRouteBarFullButton(
                  givenEvent: const AppPageInitializeUpload(),
                  givenText: letsStart2,
                  currentTheme: theme,
                  givenVerticalInset: 17,
                  givenHorizontalInset: 30,
                  givenTextSize: 18,
                  givenEdgeRadius: 40,
                  fontWeight: FontWeight.w600,
                  givenLetterSpacing: 1.2,
                ),
              ),
            ];
            }
          } else {
            if (context.widthPx < 1400) {
              widgets = [
                ScalingImage(
                  "desktop_lines.png",
                  const Offset(-150, 20),
                  height: 850,
                  scaleOnHover: false,
                ),
                Positioned(
                  left: 90,
                  top: 480,
                  child: _maydaNozzleTextWidgetPC(
                    givenHeadline: homePage3DPrintHeadline,
                    givenSecondaryHeadline: homePage3DPrintSecondaryHeadline,
                    givenText: homePage3DPrintText,
                    theme: theme,
                    width: 300,
                    headlineSize: 24,
                    secondaryHeadlineSize: 17,
                    textSize: 15
                  ),
                ),
                Positioned(
                  left: 532,
                  top: 60,
                  child: _howDoesItWorkWidget(
                      color: theme.colorScheme.shadow,
                      currentTheme: theme,
                      givenText: howDoesItWork,
                      givenVerticalInset: 15,
                      givenHorizontalInset: 43,
                      givenTextSize: 20,
                      givenEdgeRadius: 40
                  ),
                ),
                ScalingImageV2(
                  "home_page_pic_1.png",
                  const Offset(90, 70),
                  height: 345,
                  width: 340,
                  imageWidth: 270,
                  headlineSize: 16,
                  stageNumber: 1,
                  givenHeadline: homePagePic1Headline,
                  scaleWeight: 1.1,
                ),
                ScalingImageV2(
                  "home_page_pic_2.png",
                  const Offset(730, 70),
                  height: 340,
                  width: 360,
                  imageWidth: 290,
                  headlineSize: 16,
                  stageNumber: 2,
                  givenHeadline: homePagePic2Headline,
                  scaleWeight: 1.1,
                ),
                ScalingImageV2(
                  "home_page_pic_3.png",
                  const Offset(350, 405),
                  height: 340,
                  width: 360,
                  imageWidth: 290,
                  headlineSize: 16,
                  stageNumber: 3,
                  givenHeadline: homePagePic3Headline,
                  scaleWeight: 1.1,
                ),
                ScalingImageV2(
                  "home_page_pic_4.png",
                  const Offset(755, 440),
                  height: 340,
                  width: 360,
                  imageWidth: 290,
                  headlineSize: 16,
                  stageNumber: 4,
                  givenHeadline: homePagePic4Headline,
                  scaleWeight: 1.1,
                ),
                Positioned(
                  left: 500,
                  top: 800,
                  child: AppRouteBarFullButton(
                    givenEvent: const AppPageInitializeUpload(),
                    givenText: letsStart2,
                    currentTheme: theme,
                    givenVerticalInset: 17,
                    givenHorizontalInset: 35,
                    givenTextSize: 20,
                    givenEdgeRadius: 40,
                    fontWeight: FontWeight.w600,
                    givenLetterSpacing: 1.5,
                  ),
                ),
              ];
            } else {
              widgets = [
                ScalingImage(
                  "desktop_lines.png",
                  const Offset(-200, 0),
                  height: 900,
                  scaleOnHover: false,
                ),
                Positioned(
                  left: -150,
                  top: 530,
                  child: _maydaNozzleTextWidgetPC(
                    givenHeadline: homePage3DPrintHeadline,
                    givenSecondaryHeadline: homePage3DPrintSecondaryHeadline,
                    givenText: homePage3DPrintText,
                    theme: theme,
                    width: 470
                  ),
                ),
                Positioned(
                  left: 532,
                  top: 60,
                  child: _howDoesItWorkWidget(
                      color: theme.colorScheme.shadow,
                      currentTheme: theme,
                      givenText: howDoesItWork,
                      givenVerticalInset: 15,
                      givenHorizontalInset: 43,
                      givenTextSize: 20,
                      givenEdgeRadius: 40
                  ),
                ),
                ScalingImageV2(
                  "home_page_pic_1.png",
                  const Offset(-90, 90),
                  height: 400,
                  stageNumber: 1,
                  givenHeadline: homePagePic1Headline,
                  givenText: homePagePic1Text,
                ),
                ScalingImageV2(
                  "home_page_pic_2.png",
                  const Offset(750, 100),
                  height: 400,
                  stageNumber: 2,
                  givenHeadline: homePagePic2Headline,
                  givenText: homePagePic2Text,
                ),
                ScalingImageV2(
                  "home_page_pic_3.png",
                  const Offset(300, 390),
                  height: 400,
                  width: 410,
                  imageWidth: 320,
                  stageNumber: 3,
                  givenHeadline: homePagePic3Headline,
                  givenText: homePagePic3Text,
                ),
                ScalingImageV2(
                  "home_page_pic_4.png",
                  const Offset(850, 480),
                  height: 400,
                  width: 420,
                  imageWidth: 330,
                  stageNumber: 4,
                  givenHeadline: homePagePic4Headline,
                  givenText: homePagePic4Text,
                ),
                Positioned(
                  left: 500,
                  top: 820,
                  child: AppRouteBarFullButton(
                    givenEvent: const AppPageInitializeUpload(),
                    givenText: letsStart2,
                    currentTheme: theme,
                    givenVerticalInset: 17,
                    givenHorizontalInset: 35,
                    givenTextSize: 20,
                    givenEdgeRadius: 40,
                    fontWeight: FontWeight.w600,
                    givenLetterSpacing: 1.5,
                  ),
                ),
              ];
            }
          }

          return Transform.translate(
            offset: Offset(offsetX, 0),
            child: SizedBox(
              width: width,
              child: Stack(
                  clipBehavior: Clip.none,
                  children: widgets
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _howDoesItWorkWidget({
  required Color color,
  double? givenEdgeRadius,
  double? givenVerticalInset,
  double? givenHorizontalInset,
  required String givenText,
  required ThemeData currentTheme,
  double? givenTextSize,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color,
          currentTheme.colorScheme.surface
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(givenEdgeRadius ?? 8.0),
        bottomEnd: Radius.circular(givenEdgeRadius ?? 8.0),
      ),
    ),
    padding: EdgeInsets.symmetric(
        vertical: givenVerticalInset ?? 10,
        horizontal: givenHorizontalInset ?? 20
    ),
    child: Text(
      givenText,
      style: TextStyle(
        color: currentTheme.colorScheme.background,
        fontSize: givenTextSize ?? 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontFeatures: const [FontFeature.proportionalFigures()],
      ),
    ),
  );
}

Widget _maydaNozzleTextWidgetPC({
  required String givenHeadline,
  required String givenSecondaryHeadline,
  required String givenText,
  required ThemeData theme,
  double? width,
  double? headlineSize,
  double? secondaryHeadlineSize,
  double? textSize,
  double? sizedBoxSize,
  double? paddingSize,
}) {
  return SizedBox(
    width: width ?? 500,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSize ?? 48),
          child: Text(
            givenHeadline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Onest',
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.primary,
              fontSize: headlineSize ?? 24,
              fontFeatures: const [FontFeature.proportionalFigures()],
            ),
          ),
        ),
        SizedBox(height: sizedBoxSize ?? 5,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSize ?? 48),
          child: Text(
            givenSecondaryHeadline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Onest',
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
              fontSize: secondaryHeadlineSize ?? 18,
              fontFeatures: const [FontFeature.proportionalFigures()],
            ),
          ),
        ),
        SizedBox(height: sizedBoxSize ?? 5,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSize ?? 48),
          child: Text(
            givenText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Onest',
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.background,
              fontSize: textSize ?? 15,
              fontFeatures: const [FontFeature.proportionalFigures()],
            ),
          ),
        ),
      ],
    ),
  );
}


