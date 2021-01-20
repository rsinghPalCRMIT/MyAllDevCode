/**
 * @description       : 
 * @group             : 
 * @last modified on  : 07-27-2020
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-12-2020   Rohit Pal   Initial Version
**/
public with sharing class ContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        List<contact> lstCon = [SELECT FirstName, LastName, Email FROM Contact];
        throw new AuraHandledException('Forced error');
        //return lstCon;
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            LIMIT 1
        ];
    }
   
}