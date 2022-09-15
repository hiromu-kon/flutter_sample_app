import 'package:flutter_sample_app/models/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Auth', () {
    test('JsonからAuth型を生成できること', () {
      final json = {
        'accessToken': '3Uy7NIHilkOWviGXMRIl2ZUE4L7Mc8ub4VhosE3l8t8',
      };

      final auth = Auth.fromJson(json);

      expect(auth.accessToken, '3Uy7NIHilkOWviGXMRIl2ZUE4L7Mc8ub4VhosE3l8t8');
    });

    test('Auth型からJsonを生成できること', () {
      const auth = Auth(
        accessToken: 'ilLNQ-Lcp_t5DBs9puJVI3JhwqlMndTILjkBrNd3Dsc',
      );

      final authJson = auth.toJson();

      expect(
        authJson['accessToken'],
        'ilLNQ-Lcp_t5DBs9puJVI3JhwqlMndTILjkBrNd3Dsc',
      );
    });
  });
}
