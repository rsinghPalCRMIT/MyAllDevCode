({
	addNewRow: function(component, event, helper) {
       helper.createObjectData(component, event);
    },removeRow: function(component, event, helper) {
        var index = event.currentTarget.getAttribute("data-rowIndex");
        var AllRowsList = component.get("v.kycCreateChildList");
        AllRowsList.splice(index, 1);
        component.set("v.kycCreateChildList", AllRowsList);
    }
})