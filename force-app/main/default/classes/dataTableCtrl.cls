public class dataTableCtrl {
    
    @AuraEnabled
    public static List<AccountWrapper> getAccounts(){
       List<AccountWrapper> lstAccountWrapper = new List<AccountWrapper>();
        // query account records and create 'accountListWrapper' class instance for each record. 
        for(Account acc : [Select id,Name,Type,Phone
                           From Account
                           Limit 1000]){
                               // by default checkbox should be false 
                               lstAccountWrapper.add(new AccountWrapper(false,acc));
                           } 
        // return the 'lstaccountListWrapper' list 
        return lstAccountWrapper; 
    }
	
    
    public class AccountWrapper{
       @AuraEnabled public boolean isChecked {get;set;}
       @AuraEnabled public account objAccount {get;set;}
        
        public AccountWrapper(boolean isChecked , account objAccount){
            this.isChecked = isChecked;
            this.objAccount =objAccount;
        }
    }
}