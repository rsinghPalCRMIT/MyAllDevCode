global with sharing class AccountRemoter {

    public PageReference clear() {
        return null;
    }


    public PageReference getAccount() {
        return null;
    }


    public String accountName { get; set; }
    public static Account account { get; set; }
    public static boolean isValid{get;set;}
    public AccountRemoter() { } // empty constructor
    
    @RemoteAction
    global static Account getAccountaccountName(String accountName) {
        account = [SELECT Id, Name, Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accountName];
        return account;
    }
    
    @RemoteAction
    global static boolean getAccount(String accountName) {
           if(string.isNotblank(accountName)){
               isValid = true;
           }
        return isValid;
    }
}