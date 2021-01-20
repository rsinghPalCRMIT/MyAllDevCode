public with sharing class TeacherTriggerHelper {
   
    public static void updateSubject ( Map<Id, Teacher__c> newItems ,  Map<Id, Teacher__c> oldItems){
        List<subject__c> lisSubject = new List<subject__c>();
        //
        for(subject__c iterator : [SELECT id,Name,status__c,Teacher__c from subject__c where Teacher__c IN : newItems.keySet()]){
            //
            subject__c objsubject = new subject__c(Id = iterator.Id);
            objsubject.Status__c = newItems.get(iterator.Teacher__c).Status__c;
            lisSubject.add(objsubject);
        }

        update lisSubject;
    }
}