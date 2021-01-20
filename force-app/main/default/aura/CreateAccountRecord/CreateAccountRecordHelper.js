({
	createObjectData: function(component, event) {
       var RowItemList = component.get("v.kycCreateChildList");
        RowItemList.push({
            'sobjectType': 'Account',
            'Name': 'Arizona',
            'Phone': '******'
        });
        component.set("v.kycCreateChildList", RowItemList);
    }
})