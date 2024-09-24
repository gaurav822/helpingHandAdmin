import 'package:demoapp/purchase_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// PaymentStatus enum
enum PaymentStatus {
  confirmed,
  pending,
  failed,
  refunded,
  none,
}

// PaymentStatus Extension to return string value
extension PaymentStatusExtension on PaymentStatus {
  String get name {
    switch (this) {
      case PaymentStatus.confirmed:
        return 'Confirmed';
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.refunded:
        return 'Refunded';
      case PaymentStatus.none:
        return '';
      default:
        return '';
    }
  }

  // Get color based on status
  Color get color {
    switch (this) {
      case PaymentStatus.confirmed:
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}

// Updated PurchaseCard Widget
class PurchaseCard extends StatelessWidget {
  final PurchaseWithService purchase;
  final VoidCallback onConfirm;

  const PurchaseCard({
    Key? key,
    required this.purchase,
    required this.onConfirm,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Convert string status to PaymentStatus enum
    PaymentStatus paymentStatus = getServicePaymentStatus(purchase.paymentStatus);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student's name and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${purchase.studentId.firstname} ${purchase.studentId.lastname}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(purchase.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Services list
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Services:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                ...purchase.serviceTypes.map((service) => Text(
                  "- ${service.typename}: \$${service.price}",
                  style: const TextStyle(fontSize: 16),
                )),
              ],
            ),
            const SizedBox(height: 12),

            // Total Price
            Text(
              "Total Price: \$${purchase.totalPrice}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            // Payment Status Label
            Row(
              children: [
                const Text(
                  "Payment Status: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  paymentStatus.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: paymentStatus.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Conditionally show the Confirm Button
            if (paymentStatus == PaymentStatus.pending)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: Colors.green, // Green background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  PaymentStatus getServicePaymentStatus(String serviceId) {
          switch (purchase.paymentStatus.toLowerCase()) {
            case 'confirmed':
              return PaymentStatus.confirmed;
            case 'pending':
              return PaymentStatus.pending;
            case 'failed':
              return PaymentStatus.failed;
            case 'refunded':
              return PaymentStatus.refunded;
            default:
              return PaymentStatus.none;
          }
  }
}
