import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xfff8f3f3),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable manual scrolling
        children: [
          buildPage(
            context,
            imageUrl:
            'https://storage.googleapis.com/a1aa/image/wMuACgWqCP6bLpoqNriC4weQdSY0xhpIKYw88K3flat7DToTA.jpg',
            bgColor: Colors.green[200],
            title: 'Quality',
            description:
            'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
            buttonColor: Colors.green,
            onJoinMovement: () => _scrollToNextPage(),
          ),
          buildPage(
            context,
            imageUrl:
            'https://storage.googleapis.com/a1aa/image/dIpMFOdpCvJ0B1FK37ANGFJL4YJL3G9GCRYDrZ5ihAwfhJ0JA.jpg',
            bgColor: Colors.orange[200],
            title: 'Convenient',
            description:
            'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
            buttonColor: Colors.orange,
            onJoinMovement: () => _scrollToNextPage(),
          ),
          buildPage(
            context,
            imageUrl:
            'https://storage.googleapis.com/a1aa/image/6w03uc1OrIJYLtO1XPEfZLHA0PHR7wdPUDck0JkcO5teDToTA.jpg',
            bgColor: Colors.yellow[200],
            title: 'Local',
            description:
            'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
            buttonColor: Colors.yellow,
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
        required String imageUrl,
        required Color? bgColor,
        required String title,
        required String description,
        required Color buttonColor,
        required VoidCallback onJoinMovement,
      }) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('•', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 10),
                            Text('•', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 10),
                            Text('•', style: TextStyle(fontSize: 24)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          onPressed: onJoinMovement,
                          child: const Text('Join the movement!'),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => _navigateToLogin(context),
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
