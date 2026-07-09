import { LightningElement, track } from 'lwc';

export default class NewHelloworld extends LightningElement {
    @track accountName;
    handleDestructiveClick(event) {
        alert('Entered Value ::',accountName );
    }
}