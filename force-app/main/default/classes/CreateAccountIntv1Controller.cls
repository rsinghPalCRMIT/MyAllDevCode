public class CreateAccountIntv1Controller {

    @AuraEnabled
    public static account saveAccount(Account objAccount){
        if(objAccount != null){
                    insert objAccount;
            system.debug('@@ objAccount' + objAccount);

        }
        
        return objAccount;
    }
    
    @AuraEnabled
    public static Contact saveContact(Contact objContact){
        if(objContact != null){
            insert objContact;
        }
        return objContact;
    }
}