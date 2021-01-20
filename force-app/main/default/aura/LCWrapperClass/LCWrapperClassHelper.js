({
    showAccounts : function(component, event) {

        var action = component.get("c.getAllAccounts");
 		action.setParams({
            strAccountId : component.get("v.recordId"),
            //strAccountId : '0017F000023q68wQAA',
        });
      action.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {
            console.log('**************');
          //set response value in wrapperList attribute on component.
          component.set("v.accountsItems", response.getReturnValue());
		//	console.log('currency data is:' + JSON.stringify(response.getReturnValue())); //Commenting for the moment as eats browser cache 
            
        }
          console.log('++++++++++++++');
      });
      $A.enqueueAction(action);

    }
})