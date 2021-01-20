({
    valueChangeValidation : function(component, event, helper) {
        var inputField = component.find("inputField");
        console.log("@@@ " + inputField);
        var value = inputField.get("v.value");
        console.log("@@@  value" + value);
        if(value != 'foo' || value === 'undefined') {
            console.log("@@@  foo" + value);
            inputField.set('v.validity', {valid:false, badInput :true});
            inputField.showHelpMessageIfInvalid();
    
        }
    },
    validateFTE : function(component, event, helper) {
        //Get field that triggered the event
        var field = component.find(event.getSource().getLocalId());
        //Get value of field
        var val = field.get("v.value");
        //Validate entry and show error message if validation is not passed
        if(val < 0 || val > 0.49) {
            $A.util.addClass(component.find("fteError"),"show");
        } else {
            $A.util.removeClass(component.find("fteError"), "show");
        }
    }
})