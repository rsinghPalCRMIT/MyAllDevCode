public class checkAccountMap{


        public static void mapAccoutWithCase(List<Case> lstCase){
        
            set<string> setAccount = new Set<string>();
            Map<String, Account> mapAccount = new Map<String,Account>();
            List<Account> lstAccount = new List<Account>();
            for(case c : lstCase){
            
                 if(c.SuppliedEmail != null){
                     setAccount.add(c.SuppliedEmail);
                 }
            }
             for(Account a : [SELECT id,name,Email__c from Account Where Email__c IN : setAccount]){
                mapAccount.put(a.Email__c , a);
            }
           
            
            for(case c : lstCase){
              if(!mapAccount.containskey(c.ContactEmail)){                  
                  Account a = New Account();
                  a.Name = 'Test';
                  a.Email__c = c.SuppliedEmail;   
                  lstAccount.add(a);         
              }
            }
            
            insert lstAccount;
            
             for(Account a : [SELECT id,name,Email__c from Account Where Email__c IN : setAccount]){
                mapAccount.put(a.Email__c , a);
            }
            for(case c : lstCase){
              if(mapAccount.containskey(c.SuppliedEmail)){
                  
                   c.AccountId= mapAccount.get(c.SuppliedEmail).Id;
              }
            }  
            
        }
}