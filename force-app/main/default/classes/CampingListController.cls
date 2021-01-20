public class CampingListController {
	
    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        
        return [select id, name,price__c,Quantity__c,Packed__c from Camping_Item__c ];
    }
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        insert item;
        return item;
    }
}