/**
 * @File Name          : lwcCallApexMethodController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 4/16/2020, 5:21:31 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/16/2020   Rohit     Initial Version
**/
public with sharing class lwcCallApexMethodController {
    
    @AuraEnabled(cacheable=true)
    public static List<case> createCase( string Subject){
        string key = '%'+Subject+'%';
        List<Case> listCase = new List<Case>();
        listCase = [SELECT Id,Subject, Description,status, origin FROM Case WHERE subject like :key];
        return listCase;
    }
}