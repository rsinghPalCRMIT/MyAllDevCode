({
    fetchAcc : function(component, event, helper) {
        helper.fetchAccHelper(component, event, helper);
    },
    updateSelectedText: function (component, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        var selectedemailid='';
        console.log('@@@' + selectedRows);
        component.set('v.selectedRowsCount', selectedRows.length);
       for (var i = 0; i < selectedRows.length; i++){
            //alert("You selected: " + selectedRows[i].Website);
           if(selectedRows[i].Email != 'undefined'){
            	selectedemailid=selectedRows[i].Email+';'+selectedemailid;
           }    
           console.log('@@@' + selectedemailid);
        }
         
       var action = component.get("c.SendAnEmail");
        action.setParams({"strEmailIds" : selectedemailid});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
            } 
            else {
            }
        });
        $A.enqueueAction(action);
    }
})