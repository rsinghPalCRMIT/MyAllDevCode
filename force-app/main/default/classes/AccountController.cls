public with sharing class AccountController {

    @AuraEnabled
    public static void createAccount(string accountName) {
        Account account = new Account (Name = accountName);
        insert account;
    }     
    
    @AuraEnabled
    public static Boolean isDuplicateName(string accountName) {
        return ([SELECT Name FROM Account WHERE Name = :accountName].size() != 0);
    }    
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];
    }

}