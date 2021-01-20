public class ContactTriggerHandlerNew extends TriggerHandler {

    public static boolean isExecuting = true;
    public override void beforeInsert() {
        for(Contact iterator : (List<Contact >) Trigger.new) {
          // do something
          system.debug('@@@  beforeInsert >> ' + iterator);
        }
    }
  
    public override void afterInsert() {
        //
         for(Contact iterator : (List<Contact >) Trigger.new) {
          // do something
          system.debug('@@@  afterInsert >> ' + iterator);
        }
    }

    public override void beforeUpdate() {
        for(Contact iterator : (List<Contact >) Trigger.new) {
          // do something
          system.debug('@@@  beforeUpdate >> ' + iterator);
        }
    }
  
    public override void afterUpdate() {
    
     Map<Id,Contact> contactOldMap = new Map<Id, Contact>((Map<Id, Contact>) Trigger.newMap);
     system.debug('@@@  contactOldMap >> ' + contactOldMap);
        //
        if(ContactTriggerHandlerNew.isExecuting){
         ContactTriggerHandlerNew.isExecuting =false;
         for(Contact iterator : (List<Contact >) Trigger.new) {
          // do something
          system.debug('@@@  afterUpdate >> ' + iterator);
          Account acc = [SELECT Id,Description FROM Account where id =: iterator.AccountId ];
          acc.Description = 'FROm COntact';
          update acc;
          }
        }
        system.debug('@@@  contactOldMap >>  Deploy by Rohit' + contactOldMap);
    }
}