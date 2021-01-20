import { LightningElement, track } from 'lwc';
import createCase from '@salesforce/apex/lwcCallApexMethodController.createCase';
export default class LwcCallApexMethodUsingImperative extends LightningElement {

    @track subject;
    @track records;
    @track error;
    handleChange(event){
        const sVal = event.target.value;
        createCase({
            Subject : sVal
        })
        .then(result =>{
            console.log(' ---- ' , result);
            this.records = result;
        })
        .catch(error => {
            console.log(' -- error' , error);
            this.error = error;
        })
    }
}