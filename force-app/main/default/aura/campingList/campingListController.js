({
        // Load expenses from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
        createItem : function(component, event, helper){ 
            var newItem = component.get("v.newItem");
        var action = component.get("c.saveItem");
        action.setParams({
            item : newItem
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                
                var newItem ={'sobjectType': 'Camping_Item__c',
                                'Name':'',
          						'Quantity__c':0,
                                'Price__c':0,
                                'Packed__c':false,
                                'sobjectType':'Camping_Item__c'};
                                component.set("v.newItem",newItem);
                alert('Record is Created Successfully');
            }
        });
       $A.enqueueAction(action);        
    }
})