abstract class IAuthService {
  Future authenticationUser(
      {required String telefone,
      required String idToken,
      required String fcmToken});
}
