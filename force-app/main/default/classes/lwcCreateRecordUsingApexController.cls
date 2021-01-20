/**
 * @File Name          : lwcCreateRecordUsingApexController.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 4/21/2020, 6:11:38 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/20/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class lwcCreateRecordUsingApexController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountInfo( Integer limitVal){
        //
        List<Account> listAccount = new List<Account>();        
        listAccount = [SELECT Id,
                              Name,
                              Description,
                              Phone
                      FROM Account ORDER BY Createddate DESC limit :limitVal];

        return listAccount;
    }
}