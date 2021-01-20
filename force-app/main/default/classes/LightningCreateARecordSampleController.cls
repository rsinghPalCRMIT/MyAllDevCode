public class LightningCreateARecordSampleController {
    
    @AuraEnabled
    public static string saveAccountData(string objAccountName){
        Account obj = new Account();
        obj.Name = objAccountName;
        insert obj;
        return obj.id;
    }
}