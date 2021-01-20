({
	helperMethodSave : function(component, event ) {
        
        var contactInfo = component.get("v.saveContacts");
        
        var action = component.get("c.saveContact");
        action.setParams({
            objContact: contactInfo
        });
        
        action.setCallback(this, function(action){
            var state = action.getState();
            if(state === 'SUCCESS'){
                var newContact = {'sobjectType' : 'Contact',
                                  'LastName':'',
                                  'Email':''};
                
                component.set("v.saveContacts",newContact);
            }
        });
        $A.enqueueAction(action);
    }
})