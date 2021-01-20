public with sharing class dataTableSendEmailLWCController {

    @AuraEnabled
    public static List<Contact> findContacts(string strContactName){
        string strSearchkey = '%'+strContactName+'%';
        List<Contact> lstContact = [SELECT
                                           lastname,
                                           Phone,
                                           email 
                                    FROM Contact 
                                    WHERE email != null and LastName like : strSearchkey];
        return lstContact;
    }

    @AuraEnabled
    public static string sendEmailToContact(string  strContactEmail){
       List<string> lstEmails = new List<string>();
        lstEmails.add(strContactEmail);
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = lstEmails;
        message.optOutPolicy = 'FILTER';
        message.subject = 'Subject Test Message - LWC';
        message.plainTextBody = 'This is the message body.';
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }

        return '';
    }
}