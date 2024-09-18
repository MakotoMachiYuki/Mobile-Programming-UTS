import 'package:flutter/material.dart';

class UsersHistory extends StatelessWidget {
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
                left: 8,
                top: 148,
                child: Container(
                  width: 377,
                  height: 463,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 377,
                          height: 147,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 377,
                                  height: 147,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF9800),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 369,
                                  height: 135.69,
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.38999998569488525),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
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
                        top: 158,
                        child: Container(
                          width: 377,
                          height: 147,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 377,
                                  height: 147,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF9800),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 369,
                                  height: 135.69,
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.38999998569488525),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
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
                        top: 316,
                        child: Container(
                          width: 377,
                          height: 147,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 377,
                                  height: 147,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF9800),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 369,
                                  height: 135.69,
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.38999998569488525),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 150,
                child: Container(
                  width: 340,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 143,
                          height: 22,
                          child: Text(
                            'August 26, 16:15',
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
                        left: 124,
                        top: 52,
                        child: SizedBox(
                          width: 106,
                          height: 44,
                          child: Text(
                            '1x Burger super\n1x mac ’n cheese',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.18,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120,
                        top: 28,
                        child: SizedBox(
                          width: 219,
                          height: 22,
                          child: Text(
                            'BBN! Burger Bang Noel',
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
                        left: 10,
                        top: 22,
                        child: Container(
                          width: 100,
                          height: 93,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 100,
                                  height: 93,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF4E4CD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 5.81,
                                child: Container(
                                  width: 80,
                                  height: 80.21,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/80x80"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120,
                        top: 100,
                        child: Container(
                          width: 95,
                          height: 20,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 18,
                                top: 0,
                                child: SizedBox(
                                  width: 77,
                                  height: 20,
                                  child: Text(
                                    'Food delivered\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.18,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 4,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: ShapeDecoration(
                                            color: Color(0x93FF9800),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          padding: const EdgeInsets.all(1.25),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 12.50,
                                                height: 12.50,
                                                child: Stack(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 262,
                        top: 89,
                        child: Container(
                          width: 78,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF9800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 262,
                        top: 89,
                        child: Container(
                          width: 78,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xC1FFFDFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 276,
                        top: 92,
                        child: SizedBox(
                          width: 50,
                          height: 22,
                          child: Text(
                            'Repeat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 87,
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: Color(0xFF007AFF),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.43,
                  ),
                ),
              ),
              Positioned(
                left: 109,
                top: 87,
                child: SizedBox(
                  width: 167,
                  height: 25,
                  child: Text(
                    'Order History\n',
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
                left: 17,
                top: 308,
                child: Container(
                  width: 337,
                  height: 126,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 4,
                        top: 0,
                        child: Container(
                          width: 333,
                          height: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 143,
                                  height: 22,
                                  child: Text(
                                    'September 12, 6:15',
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
                                left: 117,
                                top: 52,
                                child: SizedBox(
                                  width: 106,
                                  height: 44,
                                  child: Text(
                                    '1x Nasi Ayam\n1x Rendang Ayam',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.18,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 28,
                                child: SizedBox(
                                  width: 219,
                                  height: 22,
                                  child: Text(
                                    'Nasi Ayam Buk Vivi',
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
                                left: 113,
                                top: 100,
                                child: Container(
                                  width: 95,
                                  height: 20,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 18,
                                        top: 0,
                                        child: SizedBox(
                                          width: 77,
                                          height: 20,
                                          child: Text(
                                            'Canceled\n',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0.18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 4,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: ShapeDecoration(
                                            color: Color(0x93FF9800),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 255,
                                top: 89,
                                child: Container(
                                  width: 78,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF9800),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 255,
                                top: 89,
                                child: Container(
                                  width: 78,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xC1FFFDFA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 269,
                                top: 92,
                                child: SizedBox(
                                  width: 50,
                                  height: 22,
                                  child: Text(
                                    'Repeat',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.13,
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
                        top: 17,
                        child: Container(
                          width: 113.07,
                          height: 109,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 7,
                                top: 4.79,
                                child: Container(
                                  width: 100,
                                  height: 98.78,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF4E4CD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 45.01,
                                top: 0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(0.55),
                                  child: Container(
                                    width: 80.04,
                                    height: 80.61,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Transform(
                                            transform: Matrix4.identity()
                                              ..translate(0.0, 0.0)
                                              ..rotateZ(0.55),
                                            child: Container(
                                              width: 80.04,
                                              height: 80.61,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: OvalBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: -20.61,
                                          top: -18.23,
                                          child: Transform(
                                            transform: Matrix4.identity()
                                              ..translate(0.0, 0.0)
                                              ..rotateZ(0.55),
                                            child: Container(
                                              width: 134.63,
                                              height: 89.93,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://via.placeholder.com/135x90"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
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
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 468,
                child: Container(
                  width: 320,
                  height: 121,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 143,
                          height: 22,
                          child: Text(
                            'September 10, 12:15',
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
                        left: 104,
                        top: 53,
                        child: SizedBox(
                          width: 106,
                          height: 44,
                          child: Text(
                            '1x Mie Ayam special\n1x Es teh maniez',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.18,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 29,
                        child: SizedBox(
                          width: 219,
                          height: 22,
                          child: Text(
                            'Promise Miee',
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
                        left: 100,
                        top: 101,
                        child: Container(
                          width: 110,
                          height: 20,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 18,
                                top: 0,
                                child: SizedBox(
                                  width: 92,
                                  height: 20,
                                  child: Text(
                                    'Food Delivered',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.18,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 4,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: ShapeDecoration(
                                    color: Color(0x93FF9800),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 242,
                        top: 90,
                        child: Container(
                          width: 78,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF9800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 242,
                        top: 90,
                        child: Container(
                          width: 78,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xC1FFFDFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 256,
                        top: 93,
                        child: SizedBox(
                          width: 50,
                          height: 22,
                          child: Text(
                            'Repeat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 493,
                child: Container(
                  width: 98,
                  height: 88,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 98,
                          height: 88,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4E4CD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 9,
                        child: Container(
                          width: 71,
                          height: 68,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/71x68"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
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
            ],
          ),
        ),
      ],
    );
  }
}
