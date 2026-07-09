import { LightningElement, api } from 'lwc';

export default class TestLWCChild1 extends LightningElement {
    @api rcdId;
    onclickbuttonfirst() {
        console.log('I have the first child '+rcdId);
    }
}