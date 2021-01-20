import { LightningElement, api, track } from 'lwc';

export default class Lwcchild extends LightningElement {
    @api messgae;
    @api pageno;
    @track date = new Date();


    @api
    childMethod(messagefromhere , page_no){
        //called from parent using API funnction
        this.date = new Date();
        this.messgae = messagefromhere;
        this.pageno = page_no;
    }
    handleEvent(){
        /*
        const eventS = new CustomEvent('simple',
        {
            detail : {messgae : this.messgae , pageno : this.pageno, staticVal : "Rohit Pal"}
        });
        */
       const eventS = new CustomEvent('simple',
       {
           bubbles : true,
           composed : false
       });
        this.dispatchEvent(eventS);
    }
}