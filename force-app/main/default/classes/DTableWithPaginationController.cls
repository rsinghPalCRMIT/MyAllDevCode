public with sharing class DTableWithPaginationController {
    
    @AuraEnabled
    public static List<accountwrapper> allAccountInformation(){
        List<accountwrapper> objaccountwrapper = new List<accountwrapper>();
        //
        for (account iterator : [SELECT Id,
                                        Name,
                                        type,
                                        Phone
                                FROM Account limit 100]) {
            //
            objaccountwrapper.add(new accountwrapper(iterator , false));
        }
        return objaccountwrapper;
    }

    public class accountwrapper{
        @AuraEnabled public account objAccount {get;set;}
        @AuraEnabled public Boolean isChecked {get;set;}  
        //
        public accountwrapper(account objAccount , Boolean isChecked){
            this.objAccount =objAccount;
            this.isChecked = isChecked;
        }
    }
}