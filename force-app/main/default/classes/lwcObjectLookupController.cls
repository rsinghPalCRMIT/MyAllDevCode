/**
 * @File Name          : lwcObjectLookupController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 20/5/2020, 11:12:33 am
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    20/5/2020   Rohit     Initial Version
**/
public with sharing class lwcObjectLookupController {

    @AuraEnabled(cacheable = true)
    public static List<SObject> findRecords(String searchKey, String objectName, String searchField){
        String key = '%' + searchKey + '%';
        String QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key Limit 10';
        System.debug(System.LoggingLevel.DEBUG, QUERY);
        List<SObject> sObjectList = Database.query(QUERY);
        System.debug(System.LoggingLevel.DEBUG, sObjectList);
        return sObjectList;
    }
}