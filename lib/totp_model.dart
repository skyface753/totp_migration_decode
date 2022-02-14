class TotpModel {
  String secret; // Seed
  String issuer; // Account
  String service; // Service

  TotpModel(this.secret, this.issuer, this.service);
}
