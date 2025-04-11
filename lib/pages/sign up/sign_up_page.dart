import 'package:flutter/material.dart';
import 'package:front_end_buku/pages/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:front_end_buku/config/config_apps.dart';
import 'package:http/http.dart' as http;
import 'package:g_alert/g_alert.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void register() async {
    final response = await http.post(
      Uri.parse(ConfigApps.register),
      body: {
        'username': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      Alert.show(
        context: context,
        title: 'Success',
        message: 'Berhasil Membuat Akun!',
        alertType: AlertType.success,
        onSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
      );
    } else {
      Alert.show(
        context: context,
        title: 'Error',
        message: 'Gagal membuat akun karena kesalahan server!',
        alertType: AlertType.failure,
        onFailure: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA9B5DF),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/book-icon.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'HiBook',
                    style: GoogleFonts.merriweather(
                      fontSize: 26,
                      color: const Color(0xFFFFF2F2),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 450,
                decoration: BoxDecoration(
                  color: const Color(0xFF7886C7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF3674B5), width: 2),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.merriweather(
                          fontSize: 26,
                          color: const Color(0xFFFFF2F2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Form(
                        child: Column(
                          children: [
                            Container(
                              height: 255,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name',
                                            style: GoogleFonts.merriweather(
                                              fontSize: 26,
                                              color: const Color(0xFFFFF2F2),
                                            ),
                                          ),
                                          Container(
                                            width: 280,
                                            child: TextFormField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xFFD9D9D9),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 12,
                                                    ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Email',
                                            style: GoogleFonts.merriweather(
                                              fontSize: 26,
                                              color: const Color(0xFFFFF2F2),
                                            ),
                                          ),
                                          Container(
                                            width: 280,
                                            child: TextFormField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Color(0xFFD9D9D9),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 12,
                                                    ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Password',
                                            style: GoogleFonts.merriweather(
                                              fontSize: 26,
                                              color: const Color(0xFFFFF2F2),
                                            ),
                                          ),
                                          Container(
                                            width: 280,
                                            child: TextFormField(
                                              obscureText: _obscureText,
                                              controller: passwordController,
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon:   Icon(
                                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _obscureText = !_obscureText;
                                                    });
                                                  },
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFD9D9D9),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 12,
                                                    ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(200, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    side: BorderSide(
                                      // ✅ Pindahkan `side` ke sini
                                      color: Color(0xFFA1E3F9),
                                      width: 3, // Pastikan tidak terlalu tebal
                                    ),
                                    backgroundColor: Color(0xFF578FCA),
                                  ),
                                  onPressed: () {
                                    if (emailController.text.isEmpty ||
                                          passwordController.text.isEmpty ||
                                          nameController.text.isEmpty) {
                                        Alert.show(
                                          context: context,
                                          title: 'Error',
                                          message: 'Email atau Password atau Username Kosong!',
                                          alertType: AlertType.failure,
                                          onFailure: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      } else if (emailController.text.length < 5) {
                                        Alert.show(
                                          context: context,
                                          title: 'Error',
                                          message: 'Email tidak valid!',
                                          alertType: AlertType.failure,
                                          onFailure: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      } else if (passwordController
                                              .text.length <
                                          6) {
                                        Alert.show(
                                          context: context,
                                          title: 'Error',
                                          message: 'Password tidak valid!',
                                          alertType: AlertType.failure,
                                          onFailure: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      } else if (nameController.text.length <6) {
                                        Alert.show(
                                          context: context,
                                          title: 'Error',
                                          message: 'Username tidak valid!',
                                          alertType: AlertType.failure,
                                          onFailure: () {
                                            Navigator.pop(context);
                                          },
                                        );

                                      }else {
                                        register();
                                      }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.merriweather(
                                      fontSize: 24,
                                      color: Color(0xFFFFF2F2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Already Have Account',
                                  style: GoogleFonts.merriweather(
                                    fontSize: 16,
                                    color: Color(0xFFFFF2F2),
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
          ],
        ),
      ),
      )
    );
  }
}
