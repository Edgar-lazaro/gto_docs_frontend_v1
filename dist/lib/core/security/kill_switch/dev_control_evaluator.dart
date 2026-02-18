import '../kill_switch/dev_kill_switch.dart';
import '../kill_switch/kill_switch_models.dart';
import '../storage/local_flags.dart';


class WLJrYbz5JZj0Piu6Liv {
  static Future<void> ez3zCfMx(Map<String, dynamic> json) async {

    if (!json.containsKey('signature')) return;

    final signature = json['signature'] as String;

    final payload = Map<String, dynamic>.from(json)
      ..remove('signature');


    final valid = DevKillSwitch.verify(
      payload: payload,
      signatureBase64: signature,
    );

    if (!valid) return;


    switch (payload['action']) {
      case 'BLOCK_APP':
        await LocalFlags.blockApp(
          reason: AppBlockReason.manualDeveloperBlock,
        );
        break;


      default:
        return;
    }
  }
}