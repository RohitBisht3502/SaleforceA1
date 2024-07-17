import { LightningElement } from 'lwc';
export default class RohitComponent extends LightningElement {
    greeting = 'World';
        changeHandler(event) {
        this.greeting = event.target.value;
        }
}