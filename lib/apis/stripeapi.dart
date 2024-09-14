// import 'package:stripe_payment/stripe_payment.dart';
//
// class StripeService {
//   static final String _publishableKey = 'your_publishable_key_here';
//
//   static void init() {
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: _publishableKey,
//         merchantId: "Test",
//         androidPayMode: 'test',
//       ),
//     );
//   }
//
//   static Future<void> createPaymentMethod() async {
//     try {
//       final paymentMethod = await StripePayment.paymentRequestWithCardForm(
//         CardFormPaymentRequest(),
//       );
//       return paymentMethod;
//     } catch (e) {
//       throw Exception('Error creating payment method: $e');
//     }
//   }
//
//   static Future<void> confirmPayment(String clientSecret) async {
//     try {
//       final paymentIntent = await StripePayment.confirmPaymentIntent(
//         PaymentIntent(
//           clientSecret: clientSecret,
//           paymentMethodId: null,
//         ),
//       );
//       if (paymentIntent.status == 'succeeded') {
//         print('Payment succeeded!');
//       } else {
//         throw Exception('Payment failed: ${paymentIntent.status}');
//       }
//     } catch (e) {
//       throw Exception('Error confirming payment: $e');
//     }
//   }
// }
