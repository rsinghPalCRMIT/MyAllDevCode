({
    toggleLight: function(component, event, helper){
        var params = event.getParam('arguments');
        component.set('v.isOn', params.turnOn);
    }
})