import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/view_models/signup_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends ConsumerStatefulWidget {
  const EmailScreen({
    super.key,
    required this.username,
  });

  static const routeUrl = 'email';
  static const routeName = 'email';

  final String username;

  @override
  ConsumerState<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  void _onSubmit() {
    if (!_isEmailValid()) {
      return;
    }
    ref.read(signUpForm.notifier).state = {
      "email": _email,
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  bool _isEmailValid() {
    if (_email.isEmpty) {
      return false;
    }
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return regExp.hasMatch(_email);
  }

  bool _isEmailEmptyOrValid() {
    return _email.isEmpty || _isEmailValid();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap, // NEW: for hiding keyboard
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "What's your email, ${widget.username}",
                style: const TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v32,
              TextField(
                // NEW
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                // 가상 키보드 done을 누를때 발생하는 콜백 두가지: onSubmitted & onEditingComplete
                // onSubmitted: (value) {}, // NEW: input 값이 뭔지 모를때 value 를 사용 하여 func 호출
                onEditingComplete: _onSubmit,
                // NEW: 지금은 email input 을 알고 있으므로 사용
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  hintText: 'Email',
                  errorText: _isEmailEmptyOrValid()
                      ? null
                      : 'Please, input email format like "username@tiktok.com"',
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v32,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isEmailValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }
}
