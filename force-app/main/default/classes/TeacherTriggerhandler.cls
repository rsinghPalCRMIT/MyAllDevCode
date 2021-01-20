public with sharing class TeacherTriggerhandler implements ITriggerHandler{
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

        Map<Id, Teacher__c> mapNewItemsTeacher = new Map<Id, Teacher__c>();
        Map<Id, Teacher__C> oldItemsMap = new Map<Id, Teacher__C>( (List<Teacher__C>) oldItems.values());
        for(Teacher__C iteration : (List<Teacher__C>) newItems.values()){
            //
          //  if (oldItemsMap.get(iteration.Id).status__c != iteration.status__c) {
                mapNewItemsTeacher.put(iteration.id , iteration);
         //   }
        }
        TriggerDisabled = true;
        TeacherTriggerHelper.updateSubject(mapNewItemsTeacher, oldItemsMap);
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}
}