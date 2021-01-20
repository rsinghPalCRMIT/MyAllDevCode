public class CreateAccountRecord {
	
    @AuraEnabled
    public static List<Account> createRecord (Account account){
        
        List<Account> aa = New List<Account>();
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+account);
            
            if(account != null){
                insert account;
                aa.add(account);
                return aa;
                //getshowCreatedAccountRecord(account.id);
            }
            
        } catch (Exception ex){
            return null;
        }
        return null;
    }    
     @AuraEnabled
    public static List<Account> getshowCreatedAccountRecord(){
        
        List<Account> acc = [Select ID,Name,fax,AccountNumber,phone From Account Order by createddate DESC limit 1];
        
        return acc;
        
    }
}