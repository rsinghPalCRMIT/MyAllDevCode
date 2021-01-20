public class PatientTriggerController{

    
    public static  void calculateCured(Map<Id, Patient__c> mapNewPatient , set<Id> setArea){
        
        Map<Id, Integer> mapTotalPatientCount = new Map<Id, Integer>();
        Map<Id, Integer> mapTotalPatientDays = new Map<Id, Integer>();
        for(Patient__c iterator : [SELECT Id,
                                          name,
                                          State__c,
                                          Area__c,
                                          Cured_Date__c,
                                          CreatedDate
                                   FROM Patient__c 
                                   WHERE Area__c IN : setArea
                                         AND
                                         State__c = 'Cured']){
        //
        
            if(mapTotalPatientCount.containsKey(iterator.Area__c) && mapTotalPatientDays.containsKey(iterator.Area__c)){
                mapTotalPatientCount.put(iterator.Area__c , mapTotalPatientCount.get(iterator.Area__c)+1);
                mapTotalPatientDays.put(iterator.Area__c , (iterator.Cured_Date__c).daysBetween(Date.valueOf(system.today())) + mapTotalPatientDays.get(iterator.Area__c));
            }else{
                 mapTotalPatientCount.put(iterator.Area__c , 1);
                 mapTotalPatientDays.put(iterator.Area__c , (iterator.Cured_Date__c).daysBetween(Date.valueOf(system.today())));
            }
            
             system.debug(' mapTotalPatientDays.get(iterator.Area__c) - ' + mapTotalPatientDays.get(iterator.Area__c));
             system.debug(' mapTotalPatientCount.get(iterator.Area__c) - ' + mapTotalPatientCount.get(iterator.Area__c));
        }
        
         List<Area__c> lstArea = new List<Area__c>();
         
         for(Patient__c iterator :mapNewPatient.values()){
             
             Area__c objArea = new Area__c(Id = iterator.Area__c);
             objArea.Cured_Recover__c = mapTotalPatientDays.get(iterator.Area__c) / mapTotalPatientCount.get(iterator.Area__c);
             system.debug(' objArea.Cured_Recover__c - ' + objArea.Cured_Recover__c);
             system.debug(' mapTotalPatientDays.get(iterator.Area__c) - ' + mapTotalPatientDays.get(iterator.Area__c));
             system.debug(' mapTotalPatientCount.get(iterator.Area__c) - ' + mapTotalPatientCount.get(iterator.Area__c));
             lstArea.add(objArea);
         }
         
         update lstArea;
    }
    
    
    public static  void calculateFatal(Map<Id, Patient__c> mapNewPatient , set<Id> setArea){
    
    
    }
}