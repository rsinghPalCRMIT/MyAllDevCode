/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-19-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   01-19-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class insertAccountController {
    
    @AuraEnabled
    public static Student__c insertAccountRecord(Student__c studentRecord){
        try {
            system.debug('student Record ' +  studentRecord);
            insert studentRecord;
            return studentRecord;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}