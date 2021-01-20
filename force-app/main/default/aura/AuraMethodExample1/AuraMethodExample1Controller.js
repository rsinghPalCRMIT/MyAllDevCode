({
    callBtn : function(component, event, helper) {
        console.log('Called from Button');
        component.compMtd();
    },
    callFromCompMetd : function(component, event, helper) {
        console.log('Called from Method');
        var params = event.getParam('arguments');
        if (params) {
            var param1 = params.Str;
            console.log('Called from Method take values from Auratmethod');
            alert(param1);
        }
    }
})