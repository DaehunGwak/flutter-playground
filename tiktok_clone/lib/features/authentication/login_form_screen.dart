import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/view_models/login_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends ConsumerStatefulWidget {
  const LoginFormScreen({super.key});

  @override
  ConsumerState<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends ConsumerState<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  // return 'i dont like your email';
                  return null;
                },
                onSaved: (value) {
                  if (value == null) return;
                  _formData['email'] = value;
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  // return 'wrong password';
                  return null;
                },
                onSaved: (value) {
                  if (value == null) return;
                  _formData['password'] = value;
                },
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(disabled: ref.watch(loginProvider).isLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitTap() {
    if (_formKey.currentState == null) {
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save(); // TexFormField 의 onSaved 가 호출 됨
    debugPrint(_formData.toString());

    ref.read(loginProvider.notifier).login(
          _formData['email']!,
          _formData['password']!,
          context,
        );

    // context.goNamed('/home');
    // Navigator.pushAndRemoveUntil(
    //   // NEW: 이때까지 스택된 스크린들 삭제
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const InterestsScreen(),
    //   ),
    //   (route) {
    //     debugPrint(route.toString());
    //     // return true; // 어떤 라우트도 제거 하지 않음
    //     return false; // 이때까지 Push 된 스크린(라우트) 제거
    //   },
    // );
  }
}
