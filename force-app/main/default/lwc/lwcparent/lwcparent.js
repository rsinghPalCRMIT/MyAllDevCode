import { LightningElement } from 'lwc';

export default class Lwcparent extends LightningElement {

    handleClick(){
        //way to called child component js method
       this.template.querySelector('c-lwcchild').childMethod('after passignt the method' , 20);
    }

    handleSimpleEvent(event){
        /*
        const messgae = event.detail.messgae;
        const pageno = event.detail.pageno;
        const staticVal = event.detail.staticVal;
        //console.log('-- 1 ' + messsages);
        //console.log('-- 2 ' + event.details);
        alert('Event handle - ' + messgae + '--'+pageno+' -- '+ staticVal);
         */

    //    console.log('-- 1 ' +event.target.messgae);
     //   console.log('-- 1 ' +event.target.staticVal);
    }
}