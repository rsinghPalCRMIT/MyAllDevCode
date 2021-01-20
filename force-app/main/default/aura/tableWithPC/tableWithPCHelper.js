({
	doInithelper : function(component, event) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state  === "SUCCESS"){
                 var oRes = response.getReturnValue();
                console.log('@@ oRes' + JSON.stringify(oRes));
                component.set('v.listOfAllAccounts' , oRes);
            }
        });
        $A.enqueueAction(action);
	}
})