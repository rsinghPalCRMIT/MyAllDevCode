({
	myAction : function(component, event, helper) {
		
	},
    toggleSection : function(component, event, helper) {
		var btnCls = event.getSource().get("v.class");
        console.log('btnCls '+ btnCls);
        var hideSection = btnCls + '_div';
        var dom = document.getElementById(hideSection);
        console.log('dom = '+ dom);
        var clsNames =  dom.className;
        console.log('clsNames = '+ clsNames);
        if(clsNames.indexOf('slds-hide') != -1){
            var newCls = clsNames.replace('slds-hide', '');
            dom.className = newCls;
            event.getSource().set("v.iconName", "utility:chevrondown");
        }else{
            var newCls = clsNames + ' slds-hide';
            dom.className = newCls;
            event.getSource().set("v.iconName", "utility:chevronright");
        }
	},
})