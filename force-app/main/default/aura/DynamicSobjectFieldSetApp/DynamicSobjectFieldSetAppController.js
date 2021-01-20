({
	
 create : function(component, event, helper) {
		console.log('Create record');
        //getting the candidate information
        var FieldSetName = component.get("v.FieldSetName");
        var action = component.get("c.getAllTheFields");
        //Setting the Apex Parameter
        action.setParams({
            FieldSetName : FieldSetName
        });
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                component.set("v.AllFiedsetinfo",a.getReturnValue());
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
		//adds the server-side action to the queue        
        $A.enqueueAction(action);

	},
})