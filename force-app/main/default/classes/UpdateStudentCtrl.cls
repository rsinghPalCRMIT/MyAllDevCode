public with sharing class UpdateStudentCtrl{
    /**
  * @name:        saveStudent      
  * @date:        17 Dec 2017
  * @description: This method is responsible to update student record. As this method is calling from
  *            client side lighthing component, so this should be annoted with <@AuraEnabled>.
  ***/
    @AuraEnabled
    public static void updateStudent(Student__c student){
        UPDATE student;
    }
    
    /**
  * @name:        fetchStudentDetails      
  * @date:        17 Dec 2017
  * @description: This method is responsible to fetch student record based on student id. As this method is calling from
  *            client side lighthing component, so this should be annoted with <@AuraEnabled>.
  ***/
    @AuraEnabled
    public static Student__c fetchStudentDetails(Id studentId) {
        List<Student__c> lstOfStd = new List<Student__c>();
        if(studentId != null)    
         lstOfStd = [SELECT Id, Name,Is_Travel_Required__c FROM Student__c WHERE Id = :studentId];
        if(! lstOfStd.isEmpty())
         return lstOfStd.get(0);
        
        return null;
    }
}