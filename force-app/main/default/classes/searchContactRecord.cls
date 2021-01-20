public with sharing class searchContactRecord {
    public searchContactRecord() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(string strSearchContact){
        String key = '%' + strSearchContact + '%';
        return [SELECT Id,Name,MobilePhone FROM Contact WHERE Name LIKE :key  LIMIT 10];
    }
}