({
    showAccountInformation : function(component, event) {

        var action = component.get("c.findAccounts");
        action.setParams({
            strAccountName : component.get("v.accountName"),
        });
        action.setCallback(this, function(response){

            var state = response.getState();
            if(state === "SUCCESS"){
                console.log('**************');
                component.set("v.listOfAccount" , response.getReturnValue());
            }
            console.log('++++++++++++++');
        });
        $A.enqueueAction(action);
    }
})