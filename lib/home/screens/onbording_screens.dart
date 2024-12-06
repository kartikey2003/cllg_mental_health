import 'package:flutter/material.dart';
import 'package:mental_heal_app/home/screens/login_page.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/mad.png'), // Replace with your image path
          const Text(
            "Welcome to SereneSpace",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              "Take a step towards better mental health. We are here to support you on your journey to emotional well-being.",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OnboardingScreen2())),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    )),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OnboardingScreen2())),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/mood.png'), // Replace with your image path
          const Text(
            "Track Your Mood",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              "Easily monitor your emotions daily. Understand your feelings, and take control of your mental well-being.",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'skip',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  )),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const OnboardingScreen3())),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/resources.png'),
          const Text(
            "Access Valuable Resources",
            style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              "Explore a vast library of resources. Empower yourself with knowledge to foster positive mental health.",
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: const Text(
              "Already have an account? Login",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
/*    ElevatedButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ,
              //   ),
              //   (route) => false,
              // );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(100, 50),
                side: const BorderSide(color: Colors.blue)),
            child: const Text("Get Started"),
          ),
       */