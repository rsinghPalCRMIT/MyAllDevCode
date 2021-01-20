({
    doHandle : function(component, event, helper) {
        const value = event.getParam('message');
        alert('calling lwc in lightning' +value );
    },

    
    callChild : function(component, event, helper) {
        var childComp = component.find('childcmp');
        childComp.childComponent('Rohit Pal' , 121);
    }
})