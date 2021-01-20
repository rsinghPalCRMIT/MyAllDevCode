public with sharing class UpdateContactCount {
    
    public static void upatecount(Map<Id, Contact> mapNewContact, Map<Id, Contact> mapOldContact){
        Set<id> setAccountid = new Set<id>();
        if(!mapNewContact.isEmpty()){
            for(Contact Iterator :  mapNewContact.values()){
                if(mapOldContact.get(Iterator.Id).AccountId != Iterator.AccountId){
                    setAccountid.add(Iterator.AccountId);
                    setAccountid.add(mapOldContact.get(Iterator.Id).AccountId);	
                }
            }
        }
        if (!setAccountid.isEmpty()) {
            UpdateContactCountOnAccount(setAccountid);
        }
    }
    //Test
    public static void UpdateContactCountOnAccount(set<Id> setAccountids){
        List<Account> lstAccount = [SELECT Id,description, (SELECT id,name from contacts) FROM Account WHERE Id IN :setAccountids];
        for(Account Iterator : lstAccount){
            Iterator.Description = String.valueOf(Iterator.Contacts.size());
        }
        update lstAccount;
    }
}