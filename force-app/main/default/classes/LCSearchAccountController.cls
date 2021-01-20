public with sharing class LCSearchAccountController {
    
    @AuraEnabled
    public static List<Account> findAccounts( string strAccountName){
        string strSearchKey = '%'+strAccountName+'%';
        return [Select id,name from account where name like : strSearchKey];
    }
}