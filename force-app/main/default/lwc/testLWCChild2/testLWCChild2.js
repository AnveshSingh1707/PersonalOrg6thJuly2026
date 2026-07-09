import { LightningElement, api } from 'lwc';

export default class TestLWCChild2 extends LightningElement {
    @api rcdId;
    onclickbuttonfirst() {
        console.log('I have the second child '+rcdId);
    }
}