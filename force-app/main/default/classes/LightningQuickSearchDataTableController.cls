public with sharing class LightningQuickSearchDataTableController {

    @AuraEnabled
    public static List<Account> searchAccountRecords(string strAccountName){
        List<Account> lstAccount = new List<Account>();
        string strSearchName = '%'+strAccountName+'%';
        if(String.isNotBlank(strAccountName)){
            lstAccount = [SELECT Id,
                                Name,
                                AccountNumber,
                                Fax 
                        FROM Account 
                        WHERE Name like :strSearchName];
        }else{
            lstAccount = [SELECT Id,
                                Name,
                                AccountNumber,
                                Fax 
                        FROM Account limit 5];
        }
        return lstAccount;
    }
}