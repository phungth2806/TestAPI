import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:test/pages/home/studentlist_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _isLoading = false;
  // String? _errorMessage;

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //       _errorMessage = null;
  //     });

  //     try {
  //       final response = await http.post(
  //         Uri.parse('http://10.0.2.2:5000/api/login'),
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode({
  //           'userName': _emailController.text,
  //           'pass': _passwordController.text,
  //         }),
  //       );

  //       if (response.statusCode == 200) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const StudentListScreen()),
  //         );
  //       } else {
  //         setState(() {
  //           _errorMessage = 'Đăng nhập thất bại. Vui lòng kiểm tra lại.';
  //         });
  //       }
  //     } catch (e) {
  //       setState(() {
  //         _errorMessage = 'Lỗi kết nối. Vui lòng thử lại.';
  //       });
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset('assets/DUELOGO.png', fit: BoxFit.contain),
              ),
              // Tiêu đề
              Center(
                child: Column(
                  children: [
                    Text(
                      'HỆ THỐNG',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'DÀNH CHO PHỤ HUYNH',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'ĐĂNG NHẬP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'Nhập Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập email';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MẬT KHẨU',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Nhập mật khẩu',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mật khẩu';
                              }
                              if (value.length < 6) {
                                return 'Mật khẩu phải có ít nhất 6 ký tự';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  //   _login();
                                  // }
                                  context.goNamed('studentList');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Nếu quý phụ huynh gặp vấn đề khi đăng nhập hoặc cần hỗ trợ, xin vui lòng gọi hotline 0236.395.5656 để được hỗ trợ ngay.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // if (_errorMessage != null)
              //   Padding(
              //     padding: EdgeInsets.only(top: 10),
              //     child: Center(
              //       child: Text(
              //         _errorMessage!,
              //         style: TextStyle(color: Colors.red),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
