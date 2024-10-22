import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Importing smooth page indicator package
import 'package:farmer_eats/screens/login/loginScreen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          buildPage(
            context,
            imagePath: 'assets/images/Group 44.png',
            bgColor: const Color(0xFF5EA25F), // Quality color
            title: 'Quality',
            description:
            'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
            onJoinMovement: () => _scrollToNextPage(),
          ),
          buildPage(
            context,
            imagePath: 'assets/images/Group.png',
            bgColor: const Color(0xFFD5715B), // Convenient color
            title: 'Convenient',
            description:
            'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
            onJoinMovement: () => _scrollToNextPage(),
          ),
          buildPage(
            context,
            imagePath: 'assets/images/Group 46.png',
            bgColor: const Color(0xFFF8C569), // Local color
            title: 'Local',
            description:
            'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
            onJoinMovement: () => _navigateToLogin(context),
          ),
        ],
      ),
    );
  }

  void _scrollToNextPage() {
    if (_pageController.page != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget buildPage(
      BuildContext context, {
        required String imagePath,
        required Color bgColor,
        required String title,
        required String description,
        required VoidCallback onJoinMovement,
      }) {
    return Container(
      color: bgColor,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain, // Adjusted BoxFit to contain
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),

                      // Expanding dots indicator (positioned between description and button)
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3, // Number of pages
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.black,
                          dotColor: Colors.grey,
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 3.0, // Makes the active dot expand into a bar
                          spacing: 8, // Adjust spacing between dots
                        ),
                      ),

                      const SizedBox(height: 20), // Space between indicator and button

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        onPressed: onJoinMovement,
                        child: const Text('Join the movement!', style: TextStyle(fontSize: 18)),
                      ),

                      TextButton(
                        onPressed: () => _navigateToLogin(context),
                        child: const Text('Login', style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
