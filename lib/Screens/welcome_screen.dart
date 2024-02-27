import 'package:balanced_meal/widgets/screen/material_buttom.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/welcome_screen_imge.jpeg',
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black12, Colors.black87],
                end: Alignment.bottomCenter,
                begin: Alignment.center)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              const Center(
                child: Text(
                  "Balanced Meal",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(
                flex: (screenSize.height * 0.7).toInt(),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.1,
                  ),
                  child: const Text(
                    "Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                ),
              ),
              Spacer(
                flex: (screenSize.height * 0.07).toInt(),
              ),
              MaterialButtom(
                text: "Order Food",
                colorText: Colors.white,
                colorButtom: const Color(0xFFF25700),
                fun: () {
                  Navigator.pushNamed(context, 'detailsScreen');
                },
                paddingHori: 100,
                paddingVer: 20,
                borderRadius: 20,
              ),
              Spacer(
                flex: (screenSize.height * 0.1).toInt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
