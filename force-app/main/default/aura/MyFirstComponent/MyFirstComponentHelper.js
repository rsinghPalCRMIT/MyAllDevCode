({
	saveAccountHelper : function(component, event) {
		var action = component.get("c.getAllAccount");
        action.setParams({
            "strAccountName" : component.get("v.accName")
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var AccountId  = response.getReturnValue();
            }
        });
	},
})