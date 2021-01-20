({
	doInit : function(cmp, event, helper) {
        helper.createObjectData(cmp, event);
	},
    create : function(component, event, helper) {
		console.log('Create record');
        
        //getting the candidate information
        var account = component.get("v.account");
        
        //Validation
        if($A.util.isEmpty(account.Name) || $A.util.isUndefined(account.Name)){
            alert('Name is Required');
            return;
        }            
        if($A.util.isEmpty(account.Phone) || $A.util.isUndefined(account.Phone)){
            alert('Phone is Rqquired');
            return;
        }
        if($A.util.isEmpty(account.AccountNumber) || $A.util.isUndefined(account.AccountNumber)){
            alert('AccountNumber is Required');
            return;
        }
        if($A.util.isEmpty(account.Fax) || $A.util.isUndefined(account.Fax)){
            alert('Fax is Required');
            return;
        }
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            account : account
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS" && component.isValid()){
                //Reset Form
                var newCandidate = {'sobjectType': 'Account',
                                    'Name': '',
                                    'Phone': '',
                                    'AccountNumber': '', 
                                    'Fax': ''
                                   };
                    component.set("v.account",newCandidate);
                    component.set("v.acc",a.getReturnValue());
                    alert('Record is Created Successfully');
            
                
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
               
        $A.enqueueAction(action);

	},
    addNewRow: function(component, event, helper) {
       helper.createObjectData(component, event);
    },removeRow: function(component, event, helper) {
        var index = event.currentTarget.getAttribute("data-rowIndex");
        var AllRowsList = component.get("v.kycCreateChildList");
        AllRowsList.splice(index, 1);
        component.set("v.kycCreateChildList", AllRowsList);
    }
})