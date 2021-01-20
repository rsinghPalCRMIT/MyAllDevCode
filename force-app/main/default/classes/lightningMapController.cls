public with sharing class lightningMapController {

    @AuraEnabled
    public static List<accountwrapper> allAccountLocationInfo(){
        List<accountwrapper> lstaccountwrapper = new List<accountwrapper>();
        for (Account iterator: [SELECT Name,
                                       description, 
                                       BillingCountry, 
                                       BillingCity, 
                                       BillingPostalCode, 
                                       BillingStreet, 
                                       BillingState
                                FROM Account
                                WHERE BillingCountry != null
                                and 
                                BillingCity != null limit 10]) {
            //                        
            locationwrapper objlocationwrapper = new locationwrapper();
            objlocationwrapper.Street = iterator.BillingStreet;
            objlocationwrapper.PostalCode = iterator.BillingPostalCode;
            objlocationwrapper.City = iterator.BillingCity;
            objlocationwrapper.State = iterator.BillingState;
            objlocationwrapper.Country = iterator.BillingCountry;
            //
            accountwrapper objaccountLocationWrapper = new accountwrapper();
            objaccountLocationWrapper.icon = 'standard:account'; // https://www.lightningdesignsystem.com/icons/#utility
            objaccountLocationWrapper.title = iterator.Name;
            objaccountLocationWrapper.description = iterator.description;
            objaccountLocationWrapper.location = objlocationwrapper;
            //
            lstaccountwrapper.add(objaccountLocationWrapper);                   
        }
        return lstaccountwrapper;
    }


    public class accountwrapper{
        @AuraEnabled public String icon;
        @AuraEnabled public String title;
        @AuraEnabled public String description;
        @AuraEnabled public locationwrapper location;
    }
    //
    public class locationwrapper{
        @AuraEnabled public String Street;
        @AuraEnabled public String City;
        @AuraEnabled public String PostalCode;
        @AuraEnabled public String State;
        @AuraEnabled public String Country;
    }
}