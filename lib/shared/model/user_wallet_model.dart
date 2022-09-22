class UserWalletModel {
  String id;
  double userCryptoBalance;

  UserWalletModel({
    required this.id,
    required this.userCryptoBalance,
  });

  @override
  String toString() =>
      'UserWalletModel(id: $id, userCryptoBalance: $userCryptoBalance)';
}
