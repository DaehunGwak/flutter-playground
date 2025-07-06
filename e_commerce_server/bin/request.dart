part of 'server.dart';

var menuHandler = (Request request, String mallType) {
  List<Map<String, dynamic>> data;

  if (mallType == 'market') {
    data = marketStore;
  } else {
    data = beautyStore;
  }

  Map<String, dynamic> result = {
    'status': 'SUCCESS',
    'code': '0000',
    'message': '성공',
    'data': data,
  };

  return Response.ok(
      jsonEncode(result),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
      }
  );
};

var viewModuleHandler = (Request request, String tabId, String page) {
  Map<String, dynamic> result = {
    'status': 'SUCCESS',
    'code': '0000',
    'message': '성공',
  };

  if (int.parse(page) >= 5) {
    result['data'] = [];
  } else {
    result['data'] = viewModules(
      tabId.startsWith('1', 0) ? 'market' : 'beauty',
    );
  }

  return Response.ok(
      jsonEncode(result),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
      }
  );
};