class UserRepository {
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    //* Delete from keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    //* Write to keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    //* Read from keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}
