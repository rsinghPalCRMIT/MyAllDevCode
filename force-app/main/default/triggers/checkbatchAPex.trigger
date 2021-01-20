trigger checkbatchAPex on Account (after insert , after update) {
        
         //FutureClass.myFutureMethod();
//ID jobID = System.enqueueJob(new AddPrimaryContact());
          list<contact> cc= new list<contact>();

  
  
  Map<Id,Account> mapAccount = new Map<Id,Account>();
  
  for(Account a : Trigger.new){
     
     Contact objCon = [SELECT Id,Name,Description FROM Contact WHERE AccountID =: a.Id limit 1];
     objCon.Description= 'Update From Account';
     update objCon;
     }
     
  }

//checkbatchAPexController.afterOpration(mapAccount);