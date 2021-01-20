import { LightningElement,track } from 'lwc';
import getContactDetails from '@salesforce/apex/lwcDataTableController.getContactDetails';
//
const columns = [
    { label: 'Label', fieldName: 'Id', editable: false },
    { label: 'Last Name', fieldName: 'LastName', type: 'text', editable: true },
    { label: 'First Name', fieldName: 'FirstName', type: 'text', editable: true }
];
export default class LwcDataTable extends LightningElement {

    @track lastName;
    @track data;
    @track columns = columns;
    @track rowOffset = 0;
    @track error;

    //
    handleChange(event){
        const lstName = event.target.value;
        getContactDetails({
            strName : lstName
        })
        .then(result => {
            this.data = result;
        })
        .catch(error =>{
            this.error = error;
        })
    }
}