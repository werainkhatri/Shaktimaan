import 'package:chopper/chopper.dart';

part 'api.chopper.dart';

@ChopperApi(baseUrl: 'notifications/')
abstract class APIService extends ChopperService {
  @Get(path: '1/')
  Future<Response> getProfiles();

  @Post()
  Future<Response> postFCM();

  @Get(path: '')
  Future<Response> getAllNotifs();

  static APIService create() {
    final client = ChopperClient(
      baseUrl: 'http://192.168.168.22:8000/',
      converter: JsonConverter(),
      services: [_$APIService()],
    );
    return _$APIService(client);
  }
}

//flutter packages pub run build_runner watch
