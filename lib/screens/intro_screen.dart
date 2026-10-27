import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../data/intro_data.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: introPages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = introPages[index];
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            item.image,
                              fit: BoxFit.cover

                          ),
                        ),
                        const SizedBox(height: 20),

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: introPages.length,
              effect: const WormEffect(
                activeDotColor: Color(0xffE2BE7F),
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xffE2BE7F),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPage < introPages.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentPage == introPages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: const TextStyle(
                        color: Color(0xffE2BE7F),
                      ),
                    ),

                    ),

                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}