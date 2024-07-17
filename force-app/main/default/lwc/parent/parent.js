import { LightningElement, track } from 'lwc';

export default class Parent extends LightningElement {

    message = 'Updated count will appear here!';
    show = true;

    constructor() {
        super();
        window.alert('Parent constructor called');
    }

    connectedCallback() {
        window.alert('Parent connected callback called');
        window.alert(this.template.querySelector('c-child'));
    }

    renderedCallback() {
        window.alert('Parent rendered callback called');
        window.alert(this.template.querySelector('c-child'));
    }

    errorCallback(error, stack) {
        window.alert('Parent error callback called, error = ' + JSON.stringify(error) + ', stack = ' + stack);
        window.alert(this.template.querySelector('c-child'));
    }

    updateMessage(event) {
        this.message = event.detail.message;
    }

    toggleChild() {
        this.show = !this.show;
    }
}