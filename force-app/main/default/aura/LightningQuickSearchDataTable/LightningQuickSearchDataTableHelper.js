({
    setAccountData : function(component, event) {

        var action = component.get("c.searchAccountRecords");
        action.setParams({
            strAccountName : component.get("v.accountName")
        });

        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.data" , response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})