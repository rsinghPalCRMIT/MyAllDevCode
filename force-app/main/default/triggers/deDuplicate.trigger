trigger deDuplicate on Operator__c (before insert) {
        
        
        learndeDuplication.avoideDuplication(Trigger.new);
}