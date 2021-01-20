trigger PatientTrigger on Patient__c (after update) {
    
    Map<Id, Patient__c> mapNewPatient = new Map<Id,Patient__c>();
    Map<Id, Patient__c> mapOldPatient = new Map<Id,Patient__c>(Trigger.old);
    set<Id> setArea = new set<Id>();
    switch on Trigger.operationType {
         
        when BEFORE_INSERT {
            //Invoke before insert trigger handler
            system.debug('Before Insert');
        }
        when AFTER_INSERT {
            //Invoke after insert trigger handler
            system.debug('After Insert');
        }
        when BEFORE_UPDATE {
            //Invoke before update trigger handler
            system.debug('Before Update');
        }
        when AFTER_UPDATE {
            for(Patient__c  iteration : Trigger.new){
                if(iteration.State__c != mapOldPatient.get(iteration.Id).State__c){
                    mapNewPatient.put(iteration.id , iteration);
                    setArea.add(iteration.Area__c);
                }
            }
            //
            if(!mapNewPatient.isEmpty()){
                PatientTriggerController.calculateCured(mapNewPatient , setArea);
            }
        }
        when BEFORE_DELETE {
            //Invoke before delete trigger handler
            system.debug('Before Delete');
        }
        when AFTER_DELETE {
            //Invoke after delete trigger handler
            system.debug('After Delete');
        }
        when AFTER_UNDELETE {
            //Invoke after undelete trigger handler
            system.debug('After Undelete');
        }
    }
    
}