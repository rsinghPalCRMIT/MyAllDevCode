import { LightningElement, wire, api, track } from 'lwc';
import createCase from '@salesforce/apex/lwcCallApexMethodController.createCase';
export default class LwcCallApexMethod extends LightningElement {

     @api records;
     @api errors;  
     @track subject;

    //@wire(createCase) cases;

    handleChange(event){
        const sval = event.target.value;
        this.subject = sval;
    }

    @wire(createCase,({
        Subject : '$subject'
    }))
        wiredAllCases({data, error}){
            if(data){
                this.records  = data;
                this.errors = undefined;
            }
            if(error){
                this.records  = undefined;
                this.errors = error;
            }
        }

}