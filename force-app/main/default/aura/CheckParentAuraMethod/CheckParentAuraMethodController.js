({
    callChildAMethod : function(component, event, helper) {
        //Call Child aura method
        var childComponent = component.find("childCmp");
        var message = CheckChildAuraMethod.cChildAuraMethod();
    }
})