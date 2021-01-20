public with sharing class SubjectTriggerHandler implements ITriggerHandler{
    public static Boolean TriggerDisabled = false;
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
            return TriggerDisabled;
       
    }
 
    public void BeforeInsert(List<SObject> newItems) {
        
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        Map<Id, Subject__c> mapNewItemsSubject = new Map<Id, Subject__c>();
        Map<Id, Subject__c> oldItemsMap = new Map<Id, Subject__c>((List<Subject__c>) oldItems .values());
        for(Subject__c iteration : (List<Subject__c>) newItems.values()){
            //
         //   if (oldItemsMap.get(iteration.Id).status__c != iteration.status__c) {
                mapNewItemsSubject.put(iteration.id , iteration);
         //   }
        }
        TriggerDisabled = true;
        SubjectTriggerHelper.updateTeacher(mapNewItemsSubject, oldItemsMap);
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}