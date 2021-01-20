import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {registerListener,unregisterAllListeners} from 'c/pubsub';
export default class SubComponentLwc extends LightningElement {

    //
    @wire (CurrentPageReference) pageRef;
    // connected call back fired when event inserted in the DOM
    connectedCallback(){
        registerListener('MyPubSubEvent', this.handleCallBack, this);
    }
 // connected call back fired when event removed in the DOM
    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    handleCallBack(detail){

        alert('called from PubCom to Sub Compoenent');
    }
}