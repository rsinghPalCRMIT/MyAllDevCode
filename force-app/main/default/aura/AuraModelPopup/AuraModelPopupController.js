({
	/*edit : function(component, event, helper) {
     component.set("v.recordId" , '0017F00002SjWU9QAN');
    var editRecordEvent = $A.get("e.force:editRecord");
    editRecordEvent.setParams({
        "recordId": component.get("v.recordId")
    });
    editRecordEvent.fire();
    }, */
    edit: function(component) {
       // component.set("v.recordId" , '0017F00002SjWU9QAN');
        var strAccId = component.get("v.recordId");
        
        console.log('Account Id ====>'+strAccId);
        $A.createComponent("c:AccountEditComponent", 
                           {strRecordId : strAccId},
                           function(result, status) {
                               if (status === "SUCCESS") {
                                   component.find('overlayLibDemo').showCustomModal({
                                       header: "Account Edit Form",
                                       body: result, 
                                       showCloseButton: true,
                                       cssClass: "mymodal", 
                                   })
                               }                               
                           });
    }
})