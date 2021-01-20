public with sharing class SubjectTriggerHelper {
    
    public static void updateTeacher ( Map<Id, Subject__c> newItems ,  Map<Id, Subject__c> oldItems){
        List<Teacher__c> listTeacher = new List<Teacher__c>();

        for(Subject__c iterator : newItems.values()){
            Teacher__c objTeacher = new Teacher__c(Id = iterator.Teacher__c);
            objTeacher.Status__c = iterator.Status__c;
            listTeacher.add(objTeacher);
        }

        update listTeacher;
    }
}