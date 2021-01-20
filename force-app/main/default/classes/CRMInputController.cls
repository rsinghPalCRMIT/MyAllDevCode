public class CRMInputController {
	
    @AuraEnabled
    public static string saveMyAccount(String cName , string cPhone , string cEmail){
        Contact objCon = new Contact();
        objCon.LastName = cName;
        objCon.Email = cEmail;
        objCon.Phone = cPhone;
        
        insert objCon;
        
        return objCon.Id;
    }
}