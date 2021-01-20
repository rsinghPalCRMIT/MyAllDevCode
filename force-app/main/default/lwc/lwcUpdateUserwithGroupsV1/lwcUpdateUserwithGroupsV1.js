import { LightningElement } from 'lwc';

export default class LwcUpdateUserwithGroupsV1 extends LightningElement {
    handleClick() {
        //firing an child method
        this.template.querySelector("c-lwc-update-userwith-groups").addRow();
      }
}