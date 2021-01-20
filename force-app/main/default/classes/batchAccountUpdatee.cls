global class batchAccountUpdatee implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name,description FROM Account';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Account> scope) {
         for(Account a : scope)
         {
             a.Name = a.Name + 'Updated'; 
             a.description = a.Name;
         }
         update scope;
    }   
    
    global void finish(Database.BatchableContext BC) {
    }
}