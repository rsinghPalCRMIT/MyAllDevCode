public with sharing class InsertCaseController {
    public InsertCaseController() {

    }

    public static void InsertCaseBasedOnEmail(List<Case> lstCase){

        set<string> setAccountEmail= new set<string>();
        for(case iterator : lstCase){

            if(iterator.Case_Email__c != null){
                setAccountEmail.add(iterator.Case_Email__c);
            }
        }
        //
        Map<string, account> mapName = new Map<string, account>();
        List<Account> objacc = new List<Account>();
        for(Account objAccount : [Select Id,Name,Email__c from Account where Email__c IN : setAccountEmail]){
            mapName.put(objAccount.Email__c, objAccount);
        }
        for(case iterator : lstCase){
            if(mapName.containsKey(iterator.Case_Email__c)){
                iterator.Accountid = mapName.get(iterator.Case_Email__c).id;
            }else{
                Account objAccount = new Account();
                objAccount.Name = 'Test Account';
                objAccount.Email__c = iterator.Case_Email__c;
                mapName.put(objAccount.Email__c, objAccount);
                objacc.add(objAccount);
            }
        }
        insert objacc;
         for(case iterator : lstCase){
            if(mapName.containsKey(iterator.Case_Email__c)){
                iterator.Accountid = mapName.get(iterator.Case_Email__c).id;
            }
         }   
    }
}