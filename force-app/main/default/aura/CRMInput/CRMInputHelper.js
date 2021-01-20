({
	handleClickSaveContact : function(component, event) {
		
        var action = component.get("c.saveMyAccount");
        action.setParams({
            cName : component.get("v.conName"),
            cPhone : component.get("v.conPhone"),
            cEmail : component.get("v.conEmail")
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var varContact = response.getReturnValue();
                component.set("v.myContactId" , varContact);  
                alert('@@@@ ID - ' + varContact);
            }
        });
        
        $A.enqueueAction(action);
	},
    handleClickSaveContact1 : function(component, event) {
		
        var action = component.get("c.saveMyAccount");
        action.setParams({
            cName : component.get("v.conName"),
            cPhone : component.get("v.conPhone"),
            cEmail : component.get("v.conEmail")
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var varContact = response.getReturnValue();
                component.set("v.myContactId" , varContact);  
                alert('@@@@ ID - ' + varContact);
            }
        });
        
        $A.enqueueAction(action);
	}
})