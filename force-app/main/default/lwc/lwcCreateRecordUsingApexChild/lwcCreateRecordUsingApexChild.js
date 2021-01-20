import { LightningElement, track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ACCOUNT_DESCRIPTION_FIELD from '@salesforce/schema/Account.Description';
import {createRecord} from 'lightning/uiRecordApi';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
export default class LwcCreateRecordUsingApexChild extends LightningElement {

    //
    @track AccountName;
    @track AccountPhoneNumber;
    @track AccountDescription;

    handleChange(event){
        if (event.target.label === 'Account Name') {
            this.AccountName = event.target.value;    
            console.log(' this.AccountName - ' + this.AccountName);
        }
        if (event.target.label === 'Account Phone') {
            this.AccountPhoneNumber = event.target.value;    
            console.log(' this.AccountPhoneNumber  - ' + this.AccountPhoneNumber);
        }
        if (event.target.label === 'Account Description') {
            this.AccountDescription =event.target.value;
            console.log(' this.AccountDescription  - ' + this.AccountDescription);   
        }
    }
    //
    createAccountRecord(){
        //
        const fields ={};
       
        fields[ACCOUNT_NAME_FIELD.fieldApiName] = this.AccountName;
        fields[ACCOUNT_PHONE_FIELD.fieldApiName] = this.AccountPhoneNumber;
        fields[ACCOUNT_DESCRIPTION_FIELD.fieldApiName] = this.AccountDescription;
        console.log('ACCOUNT_NAME_FIELD -- ' + this.AccountNam);
        console.log('ACCOUNT_PHONE_FIELD -- ' + this.AccountPhoneNumber);
        console.log('ACCOUNT_DESCRIPTION_FIELD -- ' + this.AccountDescription);
        //
        const recordsInput = {apiName : ACCOUNT_OBJECT.objectApiName, fields : fields};

        //
        createRecord(recordsInput)
        .then(result => {
            console.log('issue' + JSON.stringify(result));
            const event = new CustomEvent('newrecord', {
                detail: {
                    data: result
                },
            });
            this.dispatchEvent(event);
            console.log('event fired');
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account Record Created ',
                    variant: 'success',
                }),
            );
            //
            this.AccountName='';
            this.AccountPhoneNumber='';
            this.AccountDescription='';
        })
        .catch(error => {
            console.log('error' + JSON.stringify(error, null, 2));

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.message,
                    variant: 'error',
                }),
            );
        });
    }
    //
    
}