import 'package:app/formDesign.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:responsive_framework/responsive_framework.dart';
// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

bool light = true;
bool check = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      home: const FormR(),
    );
  }
}

class FormR extends StatefulWidget {
  const FormR({Key? key}) : super(key: key);

  @override
  State<FormR> createState() => _FormRState();
}

class _FormRState extends State<FormR> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light ? lightTheme : darkTheme,
        home: Scaffold(
          body: ListView(children: [
            Center(
              child: Switch(
                activeColor: const Color.fromARGB(255, 148, 48, 163),
                  value: light,
                  onChanged: (toggle) {
                    setState(() {
                      light = toggle;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.all(_width / 30.0),
              padding: EdgeInsets.all(_width / 30.0),
              decoration: BoxDecoration(
                color: light
                    ? lightTheme.backgroundColor
                    : darkTheme.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const Text(
                        "Shipping Address",
                      ),
                      Padding(padding: EdgeInsets.only(top: _width / 40.0)),
                      FormsDesign(((value) {
                        if (value!.isEmpty || value == null) {
                          return ('enter a company name');
                        } else {
                          return null;
                        }
                      }),
                          'Your Company',
                          'Company name ',
                          const Icon(
                            Icons.add_home_work,
                          ),
                          _width * 0.95,
                          1),
                      ResponsiveRowColumn(
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty || value == null) {
                                return ('enter your name');
                              } else {
                                return null;
                              }
                            }),
                                'Your Name',
                                'Client name',
                                const Icon(
                                  Icons.person_outline,
                                ),
                                _width * 0.95,
                                1),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty ||
                                  value == null ||
                                  RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return ('enter a phone number');
                              } else {
                                return null;
                              }
                            }),
                                '(999) 999-9999',
                                'Phone number ',
                                const Icon(
                                  Icons.phone,
                                ),
                                _width * 0.95,
                                1),
                          ),
                        ],
                      ),
                      ResponsiveRowColumn(
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty || value == null) {
                                return ('enter your email');
                              } else if (!EmailValidator.validate(value)) {
                              } else {
                                return null;
                              }
                            }),
                                'Email address',
                                'Email Address',
                                const Icon(
                                  Icons.email_outlined,
                                ),
                                _width * 0.95,
                                1),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 2,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty || value == null) {
                                return ('enter a  pincode');
                              } else {
                                return null;
                              }
                            }),
                                'Pincode',
                                'Pincode',
                                const Icon(
                                  Icons.phone,
                                ),
                                _width * 0.95,
                                1),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: _width / 40.0)),
                      FormsDesign(((value) {
                        if (value!.isEmpty || value == null) {
                          return ('enter a address');
                        } else {
                          return null;
                        }
                      }), 'Your Address (Area and Street)', 'Address ',
                          const Icon(null), _width * 0.95, 3),
                      ResponsiveRowColumn(
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty || value == null) {
                                return ('enter your City');
                              } else {
                                return null;
                              }
                            }),
                                'Your City/Town',
                                'City',
                                const Icon(
                                  Icons.location_city,
                                ),
                                _width * 0.95,
                                1),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: FormsDesign(((value) {
                              if (value!.isEmpty || value == null) {
                                return ('enter a your State');
                              } else {
                                return null;
                              }
                            }),
                                'Your State',
                                'State',
                                const Icon(
                                  Icons.flag,
                                ),
                                _width * 0.95,
                                1),
                          ),
                        ],
                      ),
                      _rendercheck(),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Add Billing Address ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 148, 48, 163),
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                      Row(
                        children: [
                          RaisedButton(
                            color: const Color.fromARGB(255, 73, 73, 75),
                            onPressed: () {},
                            child: const Text(
                              ' <- Prev',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                          ),
                          RaisedButton(
                            color: const Color.fromARGB(255, 148, 48, 163),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Result'),
                                    content: const Text('Susessful'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Next ->',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }

  Widget _rendercheck() {
    return Row(children: <Widget>[
      GestureDetector(
        onTap: () => _check(!check),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: check,
                  onChanged: _check,
                  activeColor: Colors.purple,
                  // ignore: prefer_const_constructors
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Text("Same is Billing Address"),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  void _check(val) {
    setState(() {
      check = val;
    });
  }

  //  themeData
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 250, 250, 250),
    backgroundColor: const Color.fromARGB(255, 73, 73, 75),
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 83, 84, 85),
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.771),
  );
}
