import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/app/sections/home/widgets/animation_text.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/animations/zoom_animation.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_html/html.dart' as html;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 30.h,
              child: Center(
                child: const EntranceFader(
                  offset: Offset(0, 0),
                  delay: Duration(seconds: 1),
                  duration: Duration(milliseconds: 800),
                  child: ZoomAnimations(),
                ),
              ),
            ),
            Space.y(10.w)!,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  hellotag,
                  style:
                      AppText.h3!.copyWith(fontSize: isFontSize(context, 18)),
                ),
                EntranceFader(
                  offset: const Offset(0, 0),
                  delay: const Duration(seconds: 2),
                  duration: const Duration(milliseconds: 800),
                  child: Image.asset(StaticImage.hi, height: 10.sp),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  yourname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isFontSize(context, 38),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            EntranceFader(
              offset: const Offset(-10, 0),
              delay: const Duration(seconds: 1),
              duration: const Duration(milliseconds: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "A ",
                    style: TextStyle(
                      fontSize: isFontSize(context, 24),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  AnimatedTextKit(
                    animatedTexts: tabList,
                    isRepeatingAnimation: true,
                  ),
                ],
              ),
            ),
            Space.y(1.w)!,
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    textAlign: TextAlign.center,
                    miniDescription,
                    style: TextStyle(
                        fontSize: isFontSize(context, 16),
                        fontWeight: FontWeight.w100,
                        color: theme.textColor.withOpacity(0.6)),
                  ),
                ),
              ),
            ),
            Space.y(2.w)!,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorChageButton(
                  text: 'download cv',
                  onTap: () {
                    html.window.open(resume, "pdf");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
