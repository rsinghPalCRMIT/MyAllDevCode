import { LightningElement , api } from 'lwc';

export default class LwcViewRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;

    handleSubmit(){

        alert('submit');
    }
    handleSuccess(){
        alert('Success');
    }
}