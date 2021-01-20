public without sharing class apexContactController {

    public contact objCon{get;set;}

    public apexContactController(ApexPages.StandardController controller) {
        objCon = new Contact();
    }
    
    public void save(){
        insert objCon;
    }
}