/**
 * @File Name          : filterContactsLwcController.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 19/5/2020, 6:42:56 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    19/5/2020   Rohit     Initial Version
**/
public with sharing class filterContactsLwcController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id accountId){
        return [select Id,Name, Phone, Email from Contact where AccountId=:accountId];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContactsByFilter(Id accountId,String key){
        String query='select Id,Name, Phone, Email from Contact where AccountId=:accountId and Name like \'%'+key+'%\'';
        return Database.query(query);
    }
}