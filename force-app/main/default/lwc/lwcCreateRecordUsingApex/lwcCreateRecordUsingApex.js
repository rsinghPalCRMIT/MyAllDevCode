import { LightningElement, track, wire, api } from 'lwc';
import getAccountInfo from '@salesforce/apex/lwcCreateRecordUsingApexController.getAccountInfo';
import {refreshApex, getSObjectValue} from '@salesforce/apex';

//
const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Description', fieldName: 'Description', type: 'text' },
];
export default class LwcCreateRecordUsingApex extends LightningElement {
    //
    @track records;
    //
    @track error;
    //
    @track columns = columns;
    //
    wiredIssueResult;
    //
    @track val = 5;
    //
    handleChange(event){
        this.val = event.target.value;
    }
    //calling to the apex class method to get the date
        @wire(getAccountInfo,{limitVal: '$val'})
        wiredCallback(result) {
            this.wiredIssueResult = result;
            if (result.data) {
                this.records = result.data;
                this.error = undefined;
            } else if (result.error) {
                this.error = result.error;
                this.parameters = undefined;
            }
    }
    handleNewRecord(evt) {
        return refreshApex(this.wiredIssueResult);
       //eval("$A.get('e.force:refreshView').fire();");

    }
}