import { LightningElement, track } from 'lwc';

export default class LwcObjectLookupSearchComponent extends LightningElement {
    @track searchKey;

    //when any value being changed to input field
    handleChange(event){
        const searchKey = event.target.value;
        //
        event.preventDefault();
        const searchEvent = new CustomEvent(
            'change', 
            { 
                detail : searchKey
            }
        );
        this.dispatchEvent(searchEvent);
    }
}