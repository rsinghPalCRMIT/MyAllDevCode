public class extsession4 {

    public contact objContact{get;set;}

    public extsession4(ApexPages.StandardController controller) {
        
        objContact = new contact();
    }
    
    public void save(){
    
        insert objContact;
    
    }

}