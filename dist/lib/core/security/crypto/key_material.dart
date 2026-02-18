import 'package:pointycastle/export.dart';

class KtmMSNUbXPg93e {

  static final ECDomainParameters _tqnEh1 =
      ECDomainParameters('secp256r1');

  /// Clave pública del desarrollador
  static final ECPublicKey xTVAbg9J8 = ECPublicKey(
    _tqnEh1.curve.createPoint(
      BigInt.parse(
        '11223344556677889900AABBCCDDEEFF11223344556677889900AABBCCDDEEFF',
        radix: 16,
      ),
      BigInt.parse(
        '99887766554433221100FFEEDDCCBBAA99887766554433221100FFEEDDCCBBAA',
        radix: 16,
      ),
    ),
    _tqnEh1,
  );
}