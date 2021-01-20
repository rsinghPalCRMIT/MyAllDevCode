public with sharing class LCWrapperClassController {
   
   @AuraEnabled
    public static List<Accountwrapper> getAllAccounts(String strAccountId){
        Map<Id, List<Accountwrapper>> mapAccount = new Map<Id, list<Accountwrapper>>();
        List<Accountwrapper> lstWrapper = new List<Accountwrapper>();
        Accountwrapper itemwrapper;
       /* for(Account acc :[SELECT id,Name,phone, (SELECT id,name,phone,email FROM Contacts) FROM Account WHERE Id =:strAccountId]){
            
            for(Contact iterator : acc.Contacts){

            }
        } */
        for(Contact Iterator : [SELECT id,name,AccountId,phone,email from contact where accountid = :strAccountId]){
            if(mapAccount.containsKey(Iterator.AccountId)){
               itemwrapper = new Accountwrapper(Iterator.AccountId,Iterator.Name,Iterator.Phone,Iterator.Email,null);
               mapAccount.get(Iterator.AccountId).add(itemwrapper);
            }
            if(!mapAccount.containsKey(Iterator.AccountId)){
                itemwrapper = new Accountwrapper(Iterator.AccountId,Iterator.Name,Iterator.Phone,Iterator.Email,null);
                mapAccount.put(Iterator.AccountId, new List<Accountwrapper>{itemwrapper});
            }
        }
       //Account
        for(Account  Iterator: [SELECT id,Name FROM Account]) {
            if(mapAccount.containsKey(Iterator.Id)){
               itemwrapper  = new Accountwrapper(Iterator.id , Iterator.Name, null,null,mapAccount.get(Iterator.Id));
               lstWrapper.add(itemwrapper);
            }
        }

       return lstWrapper;
    }

    public class Accountwrapper{
        @AuraEnabled
        public string stAccountId{get;set;}
        @AuraEnabled
        public string strName{get;set;}
        @AuraEnabled
        public string strPhone{get;set;}
        @AuraEnabled
        public string strEmail{get;set;}
        @AuraEnabled
        public List<Accountwrapper> childItems{get;set;}
        public Accountwrapper(string stAccountId,string strName,string strPhone,string strEmail,List<Accountwrapper> childItems){
            this.stAccountId = stAccountId;
            this.strName = strName;
            this.strPhone = strPhone;
            this.strEmail = strEmail;
            this.childItems = childItems;
        }
    }
}