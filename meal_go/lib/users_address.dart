import 'package:flutter/material.dart';

class UsersAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 818,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 393,
                  height: 852,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 473,
                        height: 932,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/473x932"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 19,
                child: Container(
                  width: 393,
                  height: 20,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 54,
                        padding:
                            const EdgeInsets.only(top: 18.34, bottom: 13.66),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '9:41',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 140.50,
                        padding: const EdgeInsets.only(
                          top: 23,
                          left: 30,
                          right: 32.17,
                          bottom: 18,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 7.50),
                            const SizedBox(width: 7.50),
                            Container(
                              width: 27.33,
                              height: 13,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.35,
                                      child: Container(
                                        width: 25,
                                        height: 13,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4.30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 2,
                                    top: 2,
                                    child: Container(
                                      width: 21,
                                      height: 9,
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.50),
                                        ),
                                      ),
                                    ),
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
              ),
              Positioned(
                left: 0,
                top: 832,
                child: Container(
                  width: 393,
                  height: 21,
                  padding: const EdgeInsets.symmetric(horizontal: 127),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(3.14),
                        child: Container(
                          width: 139,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 65,
                child: Container(
                  width: 393,
                  height: 69.87,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 393,
                          height: 69.87,
                          decoration: BoxDecoration(color: Color(0xFFFF9800)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 113,
                top: 87,
                child: SizedBox(
                  width: 167,
                  height: 25,
                  child: Text(
                    'My Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.06,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 66,
                top: 185,
                child: SizedBox(
                  width: 69,
                  height: 25,
                  child: Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.06,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 210,
                child: SizedBox(
                  width: 136,
                  height: 22,
                  child: Text(
                    'Jl. Swadaya V No.88 ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.15,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 88,
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: Color(0xFF007AFF),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.43,
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 235.96,
                child: Container(
                  width: 296,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 66,
                top: 261,
                child: SizedBox(
                  width: 69,
                  height: 25,
                  child: Text(
                    'Office',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.06,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 305,
                top: 109,
                child: SizedBox(
                  width: 73,
                  height: 16,
                  child: Text(
                    'Add Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.22,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 286,
                child: SizedBox(
                  width: 136,
                  height: 22,
                  child: Text(
                    'Jl. Utama Raya No.4 ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.15,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 311.96,
                child: Container(
                  width: 296,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 181,
                child: Container(
                  width: 28,
                  height: 28,
                  padding: const EdgeInsets.only(
                    top: 1.46,
                    left: 1.93,
                    right: 1.96,
                    bottom: 1.46,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.12,
                        height: 25.08,
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 258,
                child: Container(
                  width: 28,
                  height: 28,
                  padding: const EdgeInsets.only(
                    top: 1.98,
                    left: 2.33,
                    right: 2.42,
                    bottom: 1.98,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 23.24,
                        height: 24.04,
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 327,
                top: 82,
                child: Container(
                  width: 29,
                  height: 29,
                  padding: const EdgeInsets.only(
                    top: 1.87,
                    left: 1.87,
                    right: 1.78,
                    bottom: 1.78,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25.34,
                        height: 25.34,
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 313,
                top: 269,
                child: Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(1.67),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
              Positioned(
                left: 313,
                top: 196,
                child: Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(1.67),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
