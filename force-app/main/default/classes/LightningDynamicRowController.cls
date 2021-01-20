public with sharing class LightningDynamicRowController {
    

    @AuraEnabled
    public static void saveContacts(List<Contact> ListContact){
        Insert ListContact;
    }
}