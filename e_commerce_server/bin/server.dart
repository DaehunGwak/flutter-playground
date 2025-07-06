import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

import './dto/product_info.dto.dart';
import './dto/view_module.dto.dart';

part 'data.dart';
part 'request.dart';

void main(List<String> args) async {
  try {
    // 라우터 생성
    final router = Router()
      ..get('/api/menus/<mallType>', menuHandler)
      ..get('/api/view-modules/<tabId>/<page>', viewModuleHandler);
    
    // 메인 서버 실행
    final server = await serve(router, '127.0.0.1', 8080);
    print('Server listening on port ${server.port}...');

    // Swagger UI 핸들러 생성
    final path = 'specs/swagger.yaml';
    final swaggerHandler = SwaggerUI(path, title: 'Market API Spec');
    final swaggerServer = await serve(swaggerHandler, '127.0.0.1', 28080);

    print('API available at: http://${server.address.host}:${server.port}');
    print('Swagger UI available at: http://${swaggerServer.address.host}:${swaggerServer.port}');
  } catch (e) {
    print('Error starting server: $e');
  }
}

