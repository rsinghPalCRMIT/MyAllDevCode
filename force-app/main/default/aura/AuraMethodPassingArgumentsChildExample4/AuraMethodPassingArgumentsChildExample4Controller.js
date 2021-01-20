({
    turnLampOn: function(component, event, helper){
        var lamp = component.find('lamp');
        lamp.toggleLight(true);
    },
    
    turnLampOff: function(component, event, helper){
        var lamp = component.find('lamp');
        lamp.toggleLight(false);
    }
})