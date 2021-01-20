({
	helperMethod : function(component, event, helper) {
        var varEmailAddress = component.get("v.emailAddress");
        var varSubject = component.get("v.subject");
        var varBody = component.get("v.body");
		var action = component.get("c.SendanEmail"); 
         var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
                        title: "Email Send",
                        message: "New Email Has been Send",
                        type: "success"
                    });
        action.setParams({ "strEmailid" : varEmailAddress,
                          "strSubject" : varSubject,
                          "strBody" : varBody
                         });
        action.setCallback(this, function(response) {
            console.log('SAVE Resp '+response);
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.get("e.force:closeQuickAction").fire();
                $A.get("e.force:refreshView").fire();
                toastEvent.fire();
            } 
            else {
                console.log(state);
                toastEvent.setParams({
                        title: "ERROR Generating PIN",
                        message: "Please Retry!",
                        type: "error"});
            }
        });
        $A.enqueueAction(action);
	},
})