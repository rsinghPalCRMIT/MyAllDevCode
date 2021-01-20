public with sharing class LightningExpenseController {

    @AuraEnabled
    public static List<Expense_Tracker__c> saveContacts(List<Expense_Tracker__c> ListExpense){
        Insert ListExpense;
        return ListExpense;
    }
    @AuraEnabled
    public static List<Expense_Tracker__c> shoeExpenseInfo(){
        
        return [SELECT id,
                       Name,
                       Item_Name__c,
                       Purchased_On__c,
                       Purchased_Month__c,
                       Amount__c,
                       Comments__c
                FROM Expense_Tracker__c ORDER by Name ASC];
    }

    @AuraEnabled
    public static void deleteExpenseRecord(string strRecordId){
        Expense_Tracker__c objExpenseTracker = new Expense_Tracker__c(Id = strRecordId);
        delete objExpenseTracker;
    }

    @AuraEnabled
    public static List<String> getExpensePurchasedMonth(){  
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Expense_Tracker__c.Purchased_Month__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
         return options;
     }
}