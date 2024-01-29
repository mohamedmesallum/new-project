class ModelPaymentOrder {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  int? merchantOrderId;
  ShippingData? shippingData;

  ModelPaymentOrder(
      {this.authToken,
        this.deliveryNeeded,
        this.amountCents,
        this.currency,
        this.merchantOrderId,
        this.shippingData});
}
class ShippingData {
  String? email;
  String? firstName;
  String? phoneNumber;
  String? state;
  ShippingData({this.email, this.firstName, this.phoneNumber, this.state});
}