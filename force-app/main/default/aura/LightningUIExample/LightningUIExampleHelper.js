({
	createContactRecord : function(component, event) {
		 var action = component.get("c.saveContact");
        action.setParams({
            strName : component.get("v.strContactName"),
            strPhone: component.get("v.strContactPhone")
        });
        action.setCallback(this, function(action){
            var state = action.getState();
            if(state === 'SUCCESS'){
				var contactReturnId = action.getReturnValue();
                alert('Contact Created Id - ' + contactReturnId);
                component.set("v.strContactName",'');
                component.set("v.strContactPhone" , '');
            }
        });
        $A.enqueueAction(action);
	}
    
})