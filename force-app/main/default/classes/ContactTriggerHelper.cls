public with sharing class ContactTriggerHelper {

    /**
      ** Method name 
    */

    public static void updateContactCountOnAccount(Map<Id, Contact> newContactMap ,Set<Id> setAccountId){
        Map<Id, Decimal> newAccountXMap = new Map<Id, Decimal>();
        Map<Id, Decimal> newAccountYMap = new Map<Id, Decimal>();
        List<Account> listAccount = new List<Account>();
        //
        for (Contact iterator: [SELECT Id,name,AccountId,Amount_X__c,Amount_Y__c from Contact where Accountid IN : setAccountId and Amount_X__c != null and Amount_Y__c != null]) {
            //
            Decimal sum_X;
            Decimal sum_Y;
            //
            if (newAccountXMap.containsKey(iterator.AccountId)) {
               // sum_X = newAccountXMap.get(iterator.AccountId);
               // System.debug('@@@@ sum_X --' + sum_X);
               // sum_X = sum_X +iterator.Amount_X__c;
               // System.debug('@@@@ sum_X --' + sum_X);
                newAccountXMap.put(iterator.AccountId, newAccountXMap.get(iterator.AccountId) + iterator.Amount_X__c);
            }else {
                 newAccountXMap.put(iterator.AccountId, iterator.Amount_X__c);
            }
            if (newAccountYMap.containsKey(iterator.AccountId)) {
                sum_Y = newAccountYMap.get(iterator.AccountId);
                System.debug('@@@@ sum_Y --' +sum_Y);
                sum_Y = sum_Y+iterator.Amount_Y__c;
                newAccountYMap.put(iterator.AccountId, sum_Y);
                System.debug('@@@@ sum_Y --' +sum_Y);
            }else {
                newAccountYMap.put(iterator.AccountId, iterator.Amount_Y__c);
            }
        }
        //
        for (Contact iterator : newContactMap.values()) {
            //
            Account objAccount = new Account(Id = iterator.AccountId);
            objAccount.Rollup_Amount_X__c = newAccountXMap.get(iterator.AccountId);
            objAccount.Rollup_Amount_Y__c = newAccountYMap.get(iterator.AccountId);
            System.debug('@@@@ Rollup_Amount_X__c --' + objAccount.Rollup_Amount_X__c);
            System.debug('@@@@ Rollup_Amount_Y__c --'+objAccount.Rollup_Amount_Y__c);
            //objAccount.Rollup_Amount__c = newAccountXMap.get(iterator.AccountId) + newAccountYMap.get(iterator.AccountId);
            //
            listAccount.add(objAccount);
        }

        //
        update listAccount;
    } 
    
}