({
    sendHelper: function(component, getEmail, getSubject, getbody) {
		var action = component.get("c.sendEmail");
        action.setParams({
            'mMail': getEmail,
            'mSubject': getSubject,
            'mbody': getbody
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if state of server response is comes "SUCCESS",
                // display the success message box by set mailStatus attribute to true
                component.set("v.mailStatus", true);
            }
 
        });
        $A.enqueueAction(action);
	},
})