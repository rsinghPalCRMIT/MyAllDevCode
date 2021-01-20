/**
 * @File Name          : deleteRecordUsingButtonlwcController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 18/5/2020, 6:48:00 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/5/2020   Rohit     Initial Version
**/
public with sharing class deleteRecordUsingButtonlwcController {
    public deleteRecordUsingButtonlwcController() {

    }

    @AuraEnabled(Cacheable =true)
    public static List<Account> getAllAccounts(){
        //
        return [SELECT Id,
                        Name,
                        Phone,
                        Description
                FROM Account
                ORDER By CreatedDate DESC];
    }
}