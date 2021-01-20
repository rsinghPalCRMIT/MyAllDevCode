({
	doInit : function(component, event, helper) {
		var action = component.get("c.getContactList");
        action.setCallback(this, function(result){
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set("v.contactList",result.getReturnValue());   
            }
        });
        $A.enqueueAction(action);		
	},
    handleSelectAllContacts: function(component, event, helper) {
        var getID = component.get("v.contactList");
        var checkvalue = component.find("selectAll").get("v.value");        
        var checkContact = component.find("checkContact"); 
        if(checkvalue == true){
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",true);
            }
        }
        else{ 
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",false);
            }
        }
    },
})