import 'dart:math';
import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  double angle = 0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  int zekrIndex = 0;

  void onSebhaTap() {
    setState(() {
      if (counter < 33) {
        counter++;
        angle += pi / 18;
      }

      if (counter == 33) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;

          setState(() {
            counter = 0;

            if (zekrIndex < azkar.length - 1) {
              zekrIndex++;
            } else {
              zekrIndex = 0;
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sebha_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: Colors.black.withOpacity(.45),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 45),

                const Text(
                  'سبّح اسم ربك الأعلى',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: onSebhaTap,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 25,
                            child: Transform.rotate(
                              angle: -.75,
                              child: Image.asset(
                                'assets/images/sebha_head.png',
                                height: 65,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                'assets/images/sebha_body.png',
                                width: 360,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  azkar[zekrIndex],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  '$counter',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}