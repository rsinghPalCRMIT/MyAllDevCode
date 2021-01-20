({
	createObjectData: function(component, event) {
       var RowItemList = component.get("v.kycCreateChildList");
        RowItemList.push({
            'sobjectType': 'Account',
            'Name': ' ',
            'Phone': '******',
            'Industry': 'NONE'
        });
        component.set("v.kycCreateChildList", RowItemList);
    }
})