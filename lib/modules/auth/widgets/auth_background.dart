import 'package:flutter/material.dart';

import 'fade_animation.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 30,
                width: 80,
                height: 200,
                child: FadeAnimation(
                  1,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light-1.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140,
                width: 80,
                height: 150,
                child: FadeAnimation(
                  1.3,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light-2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 40,
                top: 40,
                width: 80,
                height: 150,
                child: FadeAnimation(
                  1.5,
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/clock.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: FadeAnimation(
                  1.6,
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        child
      ],
    );
  }
}
