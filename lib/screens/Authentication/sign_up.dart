import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnova/screens/Ai.dart';
import 'package:learnova/statemangment/AI_State.dart';
import 'package:learnova/statemangment/signup_state.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  // معرفات للتحكم بالنصوص
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var watch = context.watch<SignupState>();
    var read = context.read<SignupState>();

    // اللون البنفسجي الأساسي من التصميم
    const Color primaryPurple = Color(0xFF7F3DFF);
    const Color lightPurpleBackground = Color(
      0xFBF8FF,
    ); // لون خلفية الحقول الهادئ

    return Scaffold(
      backgroundColor: Colors.white,
      body: watch.startCropping == false
          ? ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              children: [
                const SizedBox(height: 20),
                Text(
                  'Learnova',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: const Color(0xFF6218D9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Begin your journey with your expert mentor.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // جزيئة الصورة الشخصية
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: read.startChoosing,
                        child: SizedBox(
                          height: height / 6,
                          child: watch.ChoosenImage == null
                              ? Image.asset('assets/images/mobile.png')
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(
                                    watch.ChoosenImage!,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/chooseProfile.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // --- بداية الحقول الجديدة بناءً على الصورة ---

                // حقل Full Name
                _buildFieldLabel('Full Name'),
                _buildTextField(
                  controller: _nameController,
                  hintText: 'Alex Morgan',
                  icon: Icons.person_outline,
                  iconColor: primaryPurple,
                  backgroundColor: lightPurpleBackground,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0, bottom: 16.0, left: 4.0),
                  child: Text(
                    'Please enter your legal name for certification.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),

                // حقل Email Address
                _buildFieldLabel('Email Address'),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'alex@example.com',
                  icon: Icons.mail_outline,
                  iconColor: primaryPurple,
                  backgroundColor: lightPurpleBackground,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // حقل Phone Number
                _buildFieldLabel('Phone Number'),
                _buildTextField(
                  controller: _phoneController,
                  hintText: '+1 (555) 000-0000',
                  icon: Icons.phone_outlined,
                  iconColor: primaryPurple,
                  backgroundColor: lightPurpleBackground,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                // حقل Password
                _buildFieldLabel('Password'),
                _buildTextField(
                  controller: _passwordController,
                  hintText: '••••••••',
                  icon: Icons.lock_outline,
                  iconColor: primaryPurple,
                  backgroundColor: lightPurpleBackground,
                  obscureText: true,
                ),
                const SizedBox(height: 8),

                // مؤشر قوة كلمة المرور (الخطوط الأربعة الملونة)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: primaryPurple,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: primaryPurple,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // حقل Confirm Password
                _buildFieldLabel('Confirm Password'),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hintText: '••••••••',
                  icon: Icons.shield_outlined,
                  iconColor: primaryPurple,
                  backgroundColor: lightPurpleBackground,
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                // زر Sign Up
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ عملية التسجيل هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // فاصل OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // زر Continue with Google
                OutlinedButton(
                  onPressed: () {
                    // تسجيل الدخول بجوجل
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                    side: const BorderSide(color: primaryPurple, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: primaryPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // نص الانتقال لتسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    GestureDetector(
                      onTap: () {
                        // الانتقال لصفحة Login
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: primaryPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (_) => AIState(),

                              child: AI(),
                            ),
                          ),
                        );
                      },
                      child: Text('GO to Ai '),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            )
          : ListView(
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: read.confirmCrop,
                        icon: const Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: read.cancelCrop,
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Crop(
                    aspectRatio: 1,
                    baseColor: Colors.black,
                    radius: 100,
                    image: watch.ChoosenImage!,
                    controller: watch.cropController,
                    onCropped: (result) {
                      switch (result) {
                        case CropSuccess(:final croppedImage):
                          watch.ChoosenImage = croppedImage;
                          break;
                        case CropFailure(:final cause):
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('خطأ: $cause')),
                          );
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }

  // دالة مساعدة لبناء عنوان الحقول (Labels)
  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  // دالة مساعدة لبناء تصميم الحقول المتشابهة في الصورة
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          suffixIcon: Icon(icon, color: iconColor.withOpacity(0.7)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
