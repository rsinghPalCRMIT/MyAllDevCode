public class FirstEmailSendController {
	@AuraEnabled
    public static void SendanEmail(String strEmailid , String strSubject , String strBody){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] { strEmailid};
        message.subject = strSubject;
        message.htmlbody = strBody;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                + results[0].errors[0].message);
        }
    }
}