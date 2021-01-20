({
	saveAccountRecord : function(component, event) {
		var action = component.get("c.saveAccountData");
        action.setParams({
            'objAccountName': component.get("v.accountName")
        });
        console.log('before set call back');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var accountId = response.getReturnValue();
                console.log('after set call back' + accountId);
                console.log('response.getReturnValue()' + response.getReturnValue());
                alert('@@@@ accountId' + accountId);
                component.set("v.accountName", null);
                component.set("v.accountId", accountId);
                // if state of server response is comes "SUCCESS",
                // display the success message box by set mailStatus attribute to true
            }
 
        });
        $A.enqueueAction(action);
	},
})