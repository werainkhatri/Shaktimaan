// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$APIService extends APIService {
  _$APIService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = APIService;

  @override
  Future<Response> getProfiles() {
    final $url = 'notifications/1/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> postFCM() {
    final $url = 'notifications/';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getAllNotifs() {
    final $url = 'notifications/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
