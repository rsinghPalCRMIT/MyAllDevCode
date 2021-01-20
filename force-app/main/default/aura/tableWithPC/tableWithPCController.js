({
	doInit : function(component, event, helper) {
		helper.doInithelper(component,event);
	},
    selectAllCheckbox : function(component, event, helper) {
        var selectedHeaderCheck = event.getSource().get("v.value");
         var listOfAllAccounts = component.get("v.listOfAllAccounts");
        for(var i=0; i<listOfAllAccounts.length; i++){
            if(selectedHeaderCheck == true){
                listOfAllAccounts[i].isChecked = true;
            }else{
              listOfAllAccounts[i].isChecked = false;   
            }
        }
        component.set("v.listOfAllAccounts", listOfAllAccounts);
	},
    checkboxSelect : function(component, event, helper) {
        
    },
})