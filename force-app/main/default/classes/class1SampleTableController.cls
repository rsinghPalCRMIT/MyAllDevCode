/**
 * @File Name          : class1SampleTableController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 19/5/2020, 3:46:36 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    19/5/2020   Rohit     Initial Version
**/
public with sharing class class1SampleTableController {
    public class1SampleTableController() {

    }

    @AuraEnabled(Cacheable=true)
    public static List<Account> getAllAccounts(){
        
        return [SELECT Id,
                       Name,
                       Phone,
                       Description
                FROM Account
                ORDER BY CreatedDate DESC
                LIMIT 10];
    }
}