trigger AvoideDuplicate on Student__c (before insert) {

  TriggerDispatcher.Run(new StudentTriggerHandler());
}