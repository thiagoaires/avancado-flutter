import 'package:meta/meta.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

abstract class HttpClient {
  Future<void> request({url});
}

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('deverá chamar http client com url correta', () {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    // arrange
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    // act
    sut.auth();

    // assing
    verify(httpClient.request(url: url));
  });
}
