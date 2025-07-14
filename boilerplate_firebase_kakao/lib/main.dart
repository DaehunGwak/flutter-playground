import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/theme/theme_data.dart';
import 'injection.dart';
import 'presentation/bloc/user_bloc/user_bloc.dart';
import 'presentation/pages/user/user_page.dart';

void main() async {
  await configureDependencies();
  KakaoSdk.init(
    nativeAppKey: '{YOUR_NATIVE_APP_KEY}',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UserBloc>()..add(UserLoginWithToken()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomThemeData.themeData,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // user page 오기 전에 BlocProvider create 를 미리 호출하기 위한 트릭
    // splash 페이지 같은 먼저 로드되는 페이지가 있다면 거기에 넣어주면 됨
    return BlocListener<UserBloc, UserState>(
      listener: (_, __) {},
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserPage()],
        ),
      ),
    );
  }
}
