({
    callCChildAUraMethod : function(component, event, helper) {
        var componentValues = event.params('arguments');
        if (componentValues) {
            var param1 = params.firstChildAuramethodAtt;
            var param2 = params.secondChildAuramethodAtt;
            alert(param1 + " " + param2);
        }
    }
})