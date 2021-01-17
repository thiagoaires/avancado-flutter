import 'package:meta/meta.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

abstract class HttpClient {
  Future<void> request({
    url,
    method,
  });
}

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(
      url: url,
      method: 'post',
    );
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClient httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    // arrange
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('deverá chamar http client com url correta', () {
    // act
    sut.auth();

    // assing
    verify(httpClient.request(
      url: url,
      method: 'post',
    ));
  });
}
