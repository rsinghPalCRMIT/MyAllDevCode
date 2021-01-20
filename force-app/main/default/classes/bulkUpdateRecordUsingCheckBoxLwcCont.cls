/**
 * @File Name          : bulkUpdateRecordUsingCheckBoxLwcCont.cls
 * @Description        : 
 * @Author             : Rohit
 * @Group              : 
 * @Last Modified On   : 19/5/2020, 5:04:40 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    18/5/2020   Rohit     Initial Version
**/
public with sharing class bulkUpdateRecordUsingCheckBoxLwcCont {
 
    //
    @AuraEnabled(cacheable=true)
    public static List<accountWrapper> getAllAccount(){
        //
        List<accountWrapper> lstWrapper = new List<accountWrapper>();
        //
        for (Account iterator : [SELECT Id,
                                        Name,
                                        Phone,
                                        Description
                                FROM Account
                                ORDER BY  CreatedDate DESC
                                LIMIT 10]) {
            //
            lstWrapper.add(new accountWrapper(false , iterator));
        }
        //
        return lstWrapper;
    }

    @AuraEnabled
    public static string selectedAllAccounts(List<account> lstAccounts){
        System.debug('@@@@ lstAccounts' + lstAccounts);
        delete lstAccounts;

        return 'true';
    }
    @AuraEnabled
    public static string selectedAllAccounts1(string lstAccounts){
        
        System.debug('@@@@ lstAccounts' + lstAccounts);

        return 'true';
    }
    //
    public class accountWrapper{
        @AuraEnabled public boolean isSelect{get;set;}
        @AuraEnabled public Account acc{get;set;}
        //
        public accountWrapper(boolean isSelect , Account acc){
            this.isSelect = isSelect;
            this.acc = acc;
        }
    }
}