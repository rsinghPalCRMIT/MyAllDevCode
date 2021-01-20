public class AccordionAuraController {
    @AuraEnabled
    public static List<Account> getContacts(){
        List<Account> contactList = new List<Account>();
        for(Account oCon : [SELECT Id, Name, (Select Id, LastName from Contacts) From Account LIMIT 10]){
           contactList.add(oCon); 
        }
        return contactList;
    }
}