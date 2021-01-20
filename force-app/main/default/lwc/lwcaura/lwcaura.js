import { LightningElement, api } from 'lwc';

export default class Lwcaura extends LightningElement {

    @api
    childComponent( message , page_no){
        console.log('called from aura method');
        console.log('called from aura method' +message);
        console.log('called from aura method' + page_no);
    }
    handleClick(){
        const eventCustom = new CustomEvent (
            'select',{
                detail : {
                    message : "this is message from LWC"
                }
            }
        );
        this.dispatchEvent(eventCustom);
    }
}