import 'package:flutter/material.dart';
import 'package:calculator/src/ui/global/app_colors.dart';
import 'package:calculator/src/ui/global/ui_helpers.dart';
import 'package:calculator/src/ui/theme/theme.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULATOR BY ENG MOUAZ ALSHAHMEH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _screenNumber = '0';
  String _oldScreenNumber = '0';
  String _calcMethod = '';

  void _storeFirstNumber(String oldScreenNumber, String calcMethod) {
    setState(() {
      _oldScreenNumber = oldScreenNumber;
      _calcMethod = calcMethod;
      _screenNumber = '0';
    });
  }

  void _resultCalc(String newScreenNumber) {
    if(_calcMethod != '') {
      if(_calcMethod == 'x') {
        setState(() {
          _screenNumber = (double.tryParse(_oldScreenNumber)! * double.tryParse(newScreenNumber)!).toString();
        });
      } else if(_calcMethod == '-') {
        setState(() {
          _screenNumber = (double.tryParse(_oldScreenNumber)! - double.tryParse(newScreenNumber)!).toString();
        });
      } else if(_calcMethod == '+') {
        setState(() {
          _screenNumber = (double.tryParse(_oldScreenNumber)! + double.tryParse(newScreenNumber)!).toString();
        });
      } else if(_calcMethod == '÷') {
        setState(() {
          _screenNumber = (double.tryParse(_oldScreenNumber)! / double.tryParse(newScreenNumber)!).toString();
        });
      } else if(_calcMethod == '%') {
        setState(() {
          _screenNumber = (double.tryParse(_oldScreenNumber)! % double.tryParse(newScreenNumber)!).toString();
        });
      }

      setState(() {
        _calcMethod = '';
        _oldScreenNumber = '0';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: textColorBlack,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.89,
                      height: screenHeight(context)*0.2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(_screenNumber,
                                  style: const TextStyle(
                                    color: textColorWhite,
                                    fontSize: 70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _screenNumber = '0';
                          });
                        },
                        child: const Text('AC',
                        style: TextStyle(
                          color: textColorBlack,
                          fontSize: 25,
                        ),
                        ),
                        style: buttonGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            return;
                          } else if(!_screenNumber.startsWith('-')) {
                            setState(() {
                              _screenNumber = '-' + _screenNumber;
                            });
                          } else if(_screenNumber.startsWith('-')) {
                            setState(() {
                              _screenNumber = _screenNumber.replaceAll('-', '');
                            });
                          }
                        },
                        child: const Text('+/-',
                          style: TextStyle(
                            color: textColorBlack,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber == '0') {
                            _storeFirstNumber(_screenNumber, '%');
                          }
                        },
                        child: const Text('%',
                          style: TextStyle(
                            color: textColorBlack,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber == '0') {
                            _storeFirstNumber(_screenNumber, '÷');
                          }
                        },
                        child: const Text('÷',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonOrangeStyle,
                      ),
                    ),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '7';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '7';
                            });
                          }
                        },
                        child: const Text('7',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '8';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '8';
                            });
                          }
                        },
                        child: const Text('8',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '9';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '9';
                            });
                          }
                        },
                        child: const Text('9',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber == '0') {
                            _storeFirstNumber(_screenNumber, 'x');
                          }
                        },
                        child: const Text('X',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonOrangeStyle,
                      ),
                    ),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '4';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '4';
                            });
                          }
                        },
                        child: const Text('4',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '5';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '5';
                            });
                          }
                        },
                        child: const Text('5',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '6';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '6';
                            });
                          }
                        },
                        child: const Text('6',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber == '0') {
                            _storeFirstNumber(_screenNumber, '-');
                          }
                        },
                        child: const Text('-',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonOrangeStyle,
                      ),
                    ),

                  ],
                ),






                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '1';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '1';
                            });
                          }
                        },
                        child: const Text('1',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '2';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '2';
                            });
                          }
                        },
                        child: const Text('2',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '3';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '3';
                            });
                          }
                        },
                        child: const Text('3',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber == '0') {
                            _storeFirstNumber(_screenNumber, '+');
                          }
                        },
                        child: const Text('+',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonOrangeStyle,
                      ),
                    ),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context)*0.43,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '0';
                            });
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '0';
                            });
                          }
                        },
                        child: const Text('0',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_screenNumber == '0') {
                            setState(() {
                              _screenNumber = '0.';
                            });
                          } else if(_screenNumber.contains('.')) {
                            return;
                          } else {
                            setState(() {
                              _screenNumber = _screenNumber + '.';
                            });
                          }
                        },
                        child: const Text(',',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonDarkGreyStyle,
                      ),
                    ),

                    SizedBox(
                      width: screenWidth(context)*0.2,
                      height: screenHeight(context)*0.1,
                      child: TextButton(
                        onPressed: () {
                          if(_oldScreenNumber != '0') {
                            _resultCalc(_screenNumber);
                          }
                        },
                        child: const Text('=',
                          style: TextStyle(
                            color: textColorWhite,
                            fontSize: 25,
                          ),
                        ),
                        style: buttonOrangeStyle,
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
