import { LightningElement } from 'lwc';

export default class LWCHooks extends LightningElement {
    name = 'Rohit';
    constructor(){
        super();
        console.log('in constructor');
        this.name = this.name+'- Cons';
    }
    connectedCallback(){
        console.log('in connectedCallback');
    }
    disconnectedCallback(){
        console.log('in disconnectedCallback');
    }
    renderedCallback(){
        console.log('in renderedCallback');
    }
    errorCallback(error , stack){
        console.error(error);
    }
}