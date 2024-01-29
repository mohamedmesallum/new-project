class UrlPayment{
  static const String bathUrl = 'https://accept.paymob.com/api';
  static const String getTokenUrl ='$bathUrl/auth/tokens';
  static const String registerOrderUrl = '$bathUrl/ecommerce/orders';
  static const String paymentKeysUrl = 'https://accept.paymob.com/api/acceptance/payment_keys';
  static const String kioskPaymentsUrl = '$bathUrl/acceptance/payments/pay';
//  static const String UrlVisi = 'https://accept.paymob.com/api/acceptance/iframes/818301?payment_token={payment_key_obtained_previously}'
  //https://accept.paymob.com/api/acceptance/Payment_keys
  //https://accept.paymob.com/api/acceptance/payment_keys
//https://accept.paymob.com/api/acceptance/payments/pay
 urlViewVisa({required String finalToken})async{
  var Url = 'https://accept.paymob.com/api/acceptance/iframes/818301?payment_token=$finalToken';
  return Url ;
}
}