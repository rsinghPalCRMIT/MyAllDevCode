public class LightningUIExampleController {
		
    @AuraEnabled
    public static string saveContact(string strName , string strPhone){
        
        Contact objContact =  new Contact();
        objContact.LastName = strName;
        objContact.Phone = strPhone;
        insert objContact;
        return objContact.Id;
    }
}