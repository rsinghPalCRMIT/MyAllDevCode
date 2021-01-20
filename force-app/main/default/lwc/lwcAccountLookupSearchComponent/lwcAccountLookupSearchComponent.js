import { LightningElement, track, api } from 'lwc';
import findRecords from '@salesforce/apex/lwcAccountLookupController.findRecords';
export default class LwcAccountLookup extends LightningElement {
   
    @track searchKey;
    @api lookupplaceholder;
    @api validation = {};
    @api objname;
    handleChange(event){
        const searchKey = event.target.value;
        event.preventDefault();
        const searchEvent = new CustomEvent(
            'change', 
            { 
                detail : searchKey
            }
        );
        this.dispatchEvent(searchEvent);
    }
    handleKeyPress({code}){
        this.dispatchEvent(new CustomEvent(
            'inputkeypress', 
            { 
                detail : code
            }
        ));
    }
    renderedCallback(){
    }
}