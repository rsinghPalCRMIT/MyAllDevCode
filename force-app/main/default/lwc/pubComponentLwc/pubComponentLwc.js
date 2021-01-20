import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {fireEvent} from 'c/pubsub';
export default class PubComponentLwc extends LightningElement {

    //
    @wire (CurrentPageReference) pageRef;
    //
    callEvent(event){
        var eventParam = {'firstname' : 'Rohit Pal'};

        fireEvent(this.pageRef ,'MyPubSubEvent',eventParam);
    }
}