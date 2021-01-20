import { LightningElement, track } from 'lwc';
import findContacts from '@salesforce/apex/dataTableSendEmailLWCController.findContacts';
import sendEmailToContact from '@salesforce/apex/dataTableSendEmailLWCController.sendEmailToContact';

const columns = [
    { label: 'Label', fieldName: 'name' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'Eemail' },
];
export default class dataTableSendEmailLWC extends LightningElement {
    @track contacts;
    @track error; 
    @track columns = columns;
    handleKeyChange(event){
       
        const strContactName = event.target.value;
        if(strContactName){
            findContacts({strContactName}).then(result => { 
                this.contacts = result; 
                // eslint-disable-next-line no-console
                console.log('I am here',this.contacts);
               // console.log(JSON.stringify(result, null, '\t'));
            }) 
            .catch(error => { 
                this.error = error; 
            }); 
        }else{
            this.contacts = undefined;
        }   
    }

    handleRowAction(event){
        const selectedRows = event.detail.selectedRows;
        if(selectedRows.length > 0) {
            // eslint-disable-next-line no-console
            const strContactEmail= selectedRows[0].Email;
            sendEmailToContact({strContactEmail}).then(result => { 
                this.contacts = result; 
                // eslint-disable-next-line no-console
                console.log('I am here',this.contacts);
            }) 
            .catch(error => { 
                this.error = error; 
            }); 
        }
    }
}