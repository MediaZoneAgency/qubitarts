class KashierPaymentRequest {
  final int amountCents;
  final String currency;
  final String merchantId;
  final String orderId;
  final Map<String, dynamic> billingData;

  KashierPaymentRequest({
    required this.amountCents,
    required this.currency,
    required this.merchantId,
    required this.orderId,
    required this.billingData,
  });

  Map<String, dynamic> toJson() => {
    "amount": (amountCents / 100).toString(),
    "currency": currency,
    "merchantId": merchantId,
    "orderId": orderId,
    "billingData": billingData,
  };
}
