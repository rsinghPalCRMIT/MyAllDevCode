({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Item Name', fieldName: 'Item_Name__c', type: 'text'},
            {label: 'Purchased On', fieldName: 'Purchased_On__c', type: 'date'},
            {label: 'Purchased Month', fieldName: 'Purchased_Month__c', type: 'text'},
            {label: 'Amount', fieldName: 'Amount__c', type: 'number'},
            {label: 'Comments', fieldName: 'Comments__c', type: 'text'},
            {label: 'Action', type: 'button', initialWidth: 135, typeAttributes: 
            {label: 'Delete', name: 'view_details', title: 'Click to View or Edit Details'}}
        ]);
        helper.createObjectData(component, event);
        helper.showExpenseHistory(component, event);
    },

    showTotalExpense : function(component, event, helper) {
        var currentData = [];
        currentData = component.get("v.data");
        var totalAmount = 0;
        for(var i=0; i<currentData.length; i++){
            console.log('@@@'+ currentData[i].Item_Name__c);
            totalAmount +=currentData[i].Amount__c;
        }
        component.set("v.totalExpenseAmount" , totalAmount);
    },
    //
    handleRowAction : function(component, event, helper) {
        var action = event.getParam('action');
        var record = event.getParam('row');
        var action = component.get("c.deleteExpenseRecord");
        action.setParams({
            strRecordId : record.Id
        });
        //
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title : 'Success',
                    message: 'Record is deleted Successfully '+ record.Id,
                    duration:' 5000',
                    key: 'info_alt',
                    type: 'success',
                    mode: 'pester'
                });
        toastEvent.fire();
                helper.showExpenseHistory(component, event);
            }
        });
        $A.enqueueAction(action);
    },
    //
    Save : function(component, event, helper) {
        var action = component.get("c.saveContacts");
        action.setParams({
            ListExpense : component.get("v.expenseList")
        });
        action.setCallback(component, function(response){
            var state = response.getReturnValue();
            if (state === "SUCCESS") {
                component.set("v.expenseList" , []);
                $A.get('e.force:refreshView').fire();
            }else{
                component.set("v.expenseList" , []);
                $A.get('e.force:refreshView').fire();
               
            }
        });
        $A.enqueueAction(action);
    },
    // function for create new object Row in Contact List 
    addNewRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
    removeDeletedRow: function(component, event, helper) {
         // get the selected row Index for delete, from Lightning Event Attribute  
         var index = event.getParam("indexVar");
         // get the all List (contactList attribute) and remove the Object Element Using splice method    
         var AllRowsList = component.get("v.expenseList");
         AllRowsList.splice(index, 1);
         // set the contactList after remove selected row element  
         component.set("v.expenseList", AllRowsList);
    },
})