public with sharing class ExtAccount {

  public string strTest{get;set;}

    public ExtAccount(ApexPages.StandardController controller) {

    }
    
    public void Test(){
        //if(strTest =='Rohit'){
       // apexpages.addMessage(new ApexPages.message(Apexpages.Severity.INFO,strTest));
       // }else{
        Navigate();
       // }

    
    }
    public pagereference Navigate(){
    
    
    
    //    if(strTest =='Rohit'){
      //      ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'account has succesfully created'));
        //}else{
            Pagereference prf = new pagereference('/a017F00000ahmHG');
            prf.setRedirect(true);
            
        //}
        return prf;
    }
}