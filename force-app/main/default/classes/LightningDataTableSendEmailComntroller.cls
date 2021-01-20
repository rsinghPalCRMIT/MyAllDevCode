public class LightningDataTableSendEmailComntroller {
	@AuraEnabled
    public static List <Contact> fetchAccounts(){
        //Qyery 10 accounts
        List<Contact> accList = [SELECT Id, 
                                 		Name, 
                                 		Phone,
                                 		Email
                                 from Contact Where id='0037F00001RmC3LQAV'
                                 LIMIT 10];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static void SendAnEmail( string strEmailIds){
        system.debug('@@@' + strEmailIds);
        strEmailIds = strEmailIds.remove(';');
		 Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] { strEmailIds};
        message.subject = 'Test';
        message.htmlbody = 'Testr';
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