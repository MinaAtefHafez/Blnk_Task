import 'package:blnk_task/data/models/user_data_model.dart';
import 'package:gsheets/gsheets.dart';

class GoogleSheetRepo {
  static const _spreadSheetId = '1kzMqAVFvPK1q3oZ-XAJKI5d_Q4avEiTGSnZDs2ZVOoA';
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "flutterapp-392910",
  "private_key_id": "82f9de4d0f3875fde4fcd588bc6006b6fab42555",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQClmn0WcQzEXrZT\nMaPV7/t3lB351JiRJrtvrrhTbMW8m0d6eNmz5wyR5dI/nSaIDVbsd2Xc1YSRyJrV\nJekCys+8E18Gn7P4LZDsimpBk1BtnoGwjtV8mzKhXG+BU/hhKAWjbsxiGI2q5uta\nGVEE74XgzLyGmh3BixZIfWNA9Kx6nIPvUpY2pebhzXmngy2y+ks6gXhCZeLO6IXp\npYUiNaMOjoheEV/kAkQE8fdPnpuC8h6IUaU9zLlSr9NFO3eA4fgis3u67+d+gldO\njAiDFeBz2TS5vcUqEkMiyEINuUtd//8PMskc++V395fq87VDd/I9R/VKHPF3lUfv\nO3ckkrMpAgMBAAECggEADxcNPULEPY6TLEXdM9eVgVd2Bc0OsUdSFBgGhCo+Dcop\nJhVQt850Ju/wtnWSTG/JaGxsKUaBjoE07qWbiR1u9tMzDlj2HsVpgSG5vfZNAWLM\nrDMlFqDTvmq8XxCw6jV/PLMSHQGMwzJzPAy2L8NzCRbO5QWydBpBnQ25Qh1+1qs6\ndQFHhUr7AYGUAq6rTaeD98a7+F+6V1X6kzKN+GwkM17dEsd7F0NY4X86yqaPIGS5\nF+yYH7selWeS7kEdm8Q0okUyNQJ1FSK+1S/1G6yGHUVdkvqLaNpZg4gj0vDrkqPT\n4P52Qe432NANeSnrJo2dR9q0YWkJVYh37zPAdn6NewKBgQDfYh4uSL4w1puCozsf\nJIKf3kxx8rD7KXzuzz+ycasSyZFof9DPWyoUA3N6oNj7IaAOZqwC/VlWiXM+Cs8W\n8hlerZrLhCtMJ2wV9K1dn+bQL8HQ+WRxCR3Zmq/oro/IhwSBqNEUlWV996PoESed\nur8bGka2WmfZzxsr8++Ia9VnKwKBgQC9yJwH6MSgDZXEkHdTlNdS6UMwZysYxSLN\n6p2sNaJZl0kGRu0ZZOjXud8SAtP7hPUXGSpX+BubhU5COqDpGNrUaLGHFnBEczkJ\nayA/+fSQqDIpABwgDHIT/JUCDbA5D8A7Nl6JVnKZAyvUNTBpKbVPlvo76MQvi/4Z\n2jOl3T2k+wKBgQC1iXuVibBm6EGBLT6C1J0DZxkhEWYa92B8gxj038NzhTQShK0h\nlqjfkt5qLgWoMW9txKrN0y6jURjCtu4Na7qKYvOFqWe2f+MrBKlPiP9++RC9z698\n3TfQ/BExO4vGH1PeO1+PJspQUMx3cFmNqZJdaEFHOLllHRar5ZYoe9n1+QKBgD7G\nksYS+qculzGzz6S4ARmNywnBtoG1A7Q1PP5vp0oXPrJy146k0Fg7RUxB3zi9XAzN\n6DG9AfTJfX9uwTcZX5kPIFnc1DnwGxfAdaRz26/V0vG49ZSsSTfPPsK1IGtfiGiN\nrWukSrfOUrsY9PB0OWMgP5l9fxdzKRQIFzlwGyntAoGAVb+oycHClLVCaELwIhHX\nyAr9U96y++M26SxzHuu1dRB1IC/+bRihEBnl2woOgOLaCuFFIx/1qv738rg+1m03\n87DkEs8NPa4Cm3/2hnUAnSIwfPxeJvYfWMcxdIz7A3voUghoOuhN+PHeGcsPeP2o\nftT1S18udbYymXzlaSHUTcc=\n-----END PRIVATE KEY-----\n",
  "client_email": "blnktask@flutterapp-392910.iam.gserviceaccount.com",
  "client_id": "110880135388399084695",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/blnktask%40flutterapp-392910.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';

  static final _gSheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future<void> init() async {
    final spreadSheet = await _gSheets.spreadsheet(_spreadSheetId);
      _userSheet = spreadSheet.worksheetByIndex(0);
       await _userSheet!.values.insertRow(1, UserModel.firstRow);
  }

  static void insertNewRowDataToGoogleSheet(Map <String , dynamic> userDataMap) async {
     await _userSheet!.values.map.appendRow(userDataMap);
   
  }
}
