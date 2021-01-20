import { LightningElement, track } from 'lwc';
import {si} from 'c/lwcutility';
//import {si} from './shared.js';
export default class Lwcsharejavascriptfile extends LightningElement {

    @track p;
    @track t;
    @track r;
    /*
    constructor(){
        super();
        const s = si(100 , 1, 10);
        console.log('@@ - '+s);
    }
*/
    calculateIntrest(){
        const ss = si(this.p , this.t, this.r);
        console.log('@@##  - ' + ss);
    }
}