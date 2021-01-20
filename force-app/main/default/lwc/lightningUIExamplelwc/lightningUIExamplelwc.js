import { LightningElement, track } from 'lwc';
import createNewContact from '@salesforce/apex/lightningUIExamplelwcController.createNewContact';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
export default class LightningUIExamplelwc extends LightningElement {

    @track error;
    @track conRecord = CONTACT_OBJECT;


    handleInput(event){
        this.conRecord.LastName = event.target.value;
        window.console.log('Last Name ==> ' + this.conRecord.LastName);
       
    }
    handlePhone(event){
        this.conRecord.Phone = event.target.value;
    }
    handleClick(event){
        createNewContact({
            objContact : this.conRecord
        })
        .then(result => {
            this.conRecord = {};
        }).catch(error=>{
            this.error = error;
             
        })
    }
}