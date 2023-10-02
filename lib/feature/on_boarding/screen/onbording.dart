import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/widgets/custom_button.dart';
import '../model/boarding_model.dart';
import '../view/build_dot.dart';
import '../widgets/boarding_view.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: boardingContents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return BoardingView(
                    boardingModel: boardingContents[i],
                    height: MediaQuery.sizeOf(context).height * 0.45,
                  );
                },
              ),
            ),
            Visibility(
              visible: currentIndex < boardingContents.length - 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  boardingContents.length,
                  (index) => BuildDotBoardingView(
                    index: index,
                    currentIndex: currentIndex,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: currentIndex == boardingContents.length - 1,
              child: CustomButton(
                onTap: () {},
                title: AppString.getStartit,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            )
          ],
        ),
      ),
    );
  }
}