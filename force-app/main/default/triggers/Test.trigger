trigger Test on Lead (before update) {
        
        
        for(lead ld : trigger.New){
        
           if(ld.email != TRIGGER.oldMap.get(ld.id).email){
           
              ld.lastname = TRIGGER.oldMap.get(ld.id).email;
              //update ld;
           }
        
        }
}