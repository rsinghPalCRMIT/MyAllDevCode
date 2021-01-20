/**
 * @File Name          : lwcAccountLookupController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 20/5/2020, 2:57:11 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    20/5/2020   Rohit     Initial Version
**/
public with sharing class lwcAccountLookupController {
    @AuraEnabled(cacheable = true)
    public static List<Account> findRecords(String searchKey){
        String key = '%' + searchKey + '%';
        String QUERY = 'Select Id, Name From Account Where Name LIKE :key Limit 10';
        return Database.query(QUERY);
    }
}