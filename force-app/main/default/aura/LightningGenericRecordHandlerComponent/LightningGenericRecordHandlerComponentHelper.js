({
    checkSobjectType : function(component, event) {
        var action = component.get("c.sobjectTypeInfo");
        action.setParams({
            "strObjectType" : component.find("select").get("v.value")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.sobjectItems" , response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    selectObjectRecords : function(component, event, selectedObject) {
        var action= component.get("c.getRecords");
        action.setParams({
            "objectName" : selectedObject
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.data" , response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})