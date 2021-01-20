public class DisplayAccountandCont {
	
    @AuraEnabled
    Public static List<Account> getAccount(){
    	List<Account> lstAccount = [SELECT id,Name From Account limit 10];    
        
        return lstAccount;
    }
}