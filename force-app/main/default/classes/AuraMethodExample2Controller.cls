public class AuraMethodExample2Controller {
	
    @AuraEnabled
    public static List<String> getServerSideParams(){
        return new List<String>{'Salesforce header from Server' ,'Salesforce footer from Server' , 'Salesforce title from Server' };
    }    
}