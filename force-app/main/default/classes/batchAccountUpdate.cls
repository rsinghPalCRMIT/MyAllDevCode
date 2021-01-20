global class batchAccountUpdate implements Database.Batchable<sObject> {
    global List<Account> lstAccount = new List<Account>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<Account> scope) {
         for(Account a : scope)
         {
             a.Name = 'finish - from Batch';            
         }
         lstAccount.addAll(scope);
        update lstAccount;
    }   
    
    global void finish(Database.BatchableContext BC) {
        
        batchAccountUpdatee b = new batchAccountUpdatee();
        database.executeBatch(b);
        
        ID jobID = System.enqueueJob(new AddPrimaryContact());
        
    }
}