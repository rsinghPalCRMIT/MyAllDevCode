({
    onTypeChange : function(component, event, helper) {
        helper.checkSobjectType(component, event);
    },
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Action', type: 'button', initialWidth: 135, typeAttributes: 
             { label: 'View', name: 'view_details', title: 'Click to View or Edit Details'}}
        ]);
    },
    getSelectObjectRecords : function(component, event, helper) {
        var selectedObject = component.find("objectList").get("v.value");
        //hide show details component
        component.set("v.showDetails", false);
        helper.selectObjectRecords(component, event,selectedObject);
    },
    handleRowAction : function (component, event, helper) {
        var action = event.getParam('action');
        var record = event.getParam('row');
        switch (action.name) {
            case 'view_details':
                component.set("v.selectedRecord", record.Id);
                component.set("v.selectedObject", component.find("objectList").get("v.value"));
                break;
        }
        
        if(component.get("v.selectedRecord")){
            //Show component details
            component.set("v.showDetails", true);
        }
    },
    onModeChange : function(component, event, helper) {
        var recordFormMode = component.find("modeList").get("v.value");
        if(recordFormMode === "ReadOnly Mode"){
        	component.set("v.recordFormMode", "readonly");
        } else{
           	component.set("v.recordFormMode", "view");
        }
    },
    // this function automatic call by aura:waiting event  
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
         component.set("v.Spinner", true); 
    },
     
  // this function automatic call by aura:doneWaiting event 
     hideSpinner : function(component,event,helper){
      // make Spinner attribute to false for hide loading spinner    
        component.set("v.Spinner", false);
     }
})