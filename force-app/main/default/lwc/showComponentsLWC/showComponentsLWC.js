import { LightningElement , track } from 'lwc';

export default class ShowComponentsLWC extends LightningElement {

    @track isDisable=false;

    handleChange(event){
        this.isDisable = event.target.checked;
    }
}