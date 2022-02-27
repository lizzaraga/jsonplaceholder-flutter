import 'package:jsonplaceholder/api/reqs/login.request.dart';
import 'package:jsonplaceholder/api/rest.client.dart';
import 'package:jsonplaceholder/services/token.storage.service.dart';

class AuthenticationCtrl {
  final RestClient restClient;
  final TokenStorageService tokenStorageService;

  AuthenticationCtrl(this.restClient, this.tokenStorageService);

  void login(LoginRequest request) async {
    try{
      String token = await restClient.login(request);
      await tokenStorageService.saveToken(token);
      bool isAmbass = await restClient.checkRole(); 
    }
    catch{

    }
  }
}
