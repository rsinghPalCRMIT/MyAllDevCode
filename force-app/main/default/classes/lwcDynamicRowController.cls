/**
 * @File Name          : lwcDynamicRowController.cls
 * @Description        : 
 * @Author             : Rohit Pal
 * @Group              : 
 * @Last Modified On   : 5/12/2020, 10:31:32 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/12/2020   Rohit Pal     Initial Version
**/
public with sharing class lwcDynamicRowController {
    public lwcDynamicRowController() {
 
    }

    @AuraEnabled(Cacheable = true)
    public static Account createAccount(account accountRecObj){
        try {
            insert accountRecObj;
            return accountRecObj;
        } catch (Exception e) {
            return accountRecObj;
        } 
    }

    @AuraEnabled
    public static List<Account> createAccounts(List<Account> accountList){
        System.debug('@@@@ ' + accountList);
        insert accountList;
        return accountList;
    }
}