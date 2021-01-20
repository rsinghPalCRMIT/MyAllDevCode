/**
 * @File Name          : createAndUpdateRecordLWCController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 18/5/2020, 4:55:42 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/5/2020   Rohit     Initial Version
**/
public with sharing class createAndUpdateRecordLWCController {
    //
    public createAndUpdateRecordLWCController() {

    }
    //
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccount(){
        //
        return [SELECT Id,
                       Name,
                       Phone,
                       Description 
                FROM ACCOUNT 
                ORDER BY LastModifieddate DESC];
    }
    //
    @AuraEnabled
    public static Account updateSelectedAccount(string strAccountId){
        //
        Account acc = new Account(Id = strAccountId);
        acc.Description = 'Updated';
        update acc;
        //
        return acc;
    }
}