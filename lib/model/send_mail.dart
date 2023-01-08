import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shop_app/providers/cart.dart';

class SendMail {
  sendMail(List<CartItem> orderData, double amount) async {
    //print('***Orderdata :$orderData ,,,${orderData.length}');
    String username = 'sanushaw144@gmail.com';
    String password = 'sanu97shaw';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add(Address('sanushaw14@gmail.com'))
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Order Placed 😀 :: ${DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now())}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = """
      <h3>Order Amount - $amount rs</h3>
      <p>Details:</p><p>${productsAsString(orderData)}</p>
      """;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE

    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // close the connection
    await connection.close();
  }

  String productsAsString(List<CartItem> orderData) {
    String result = '';
    for(final prod in orderData){
      //print('Data : ${prod.title}');
      result += ' Item : ${prod.title}, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;';
      result += 'Quantity : ${prod.quantity}<br>'
          ;
    }
    return result;
  }
}
