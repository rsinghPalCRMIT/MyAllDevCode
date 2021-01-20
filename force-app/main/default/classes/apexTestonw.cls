public class apexTestonw {

    public Contact objContact {get;set;}
    public apexTestonw(ApexPages.StandardController controller) {
        
        objContact = new contact();
    }
    
    public void Save(){
        
        insert objContact;
    }

}