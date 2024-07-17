import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {

    count = 0;
    @api
    message = 'default';

    constructor() {
        super();
        window.alert('Child constructor called');
        window.alert('Child constructor called'+this.count);
        window.alert('Child constructor called'+this.message);
        window.alert('Child constructor called'+this.template.querySelector('lightning-button'));
    }

    connectedCallback() {
        window.alert('Child connected callback called');
        window.alert('Child connected callback called'+this.count);
        window.alert('Child connected callback called'+this.message);
        window.alert('Child connected callback called'+this.template.querySelector('lightning-button'));
        let error = {
            code: 100,
            message: 'Error from child connected callback!'
        };
        throw error;
    }

    renderedCallback() {
        window.alert('Child rendered callback called');
        window.alert('Child rendered callback called'+this.template.querySelector('lightning-button'));
    }

    disconnectedCallback() {
        window.alert('Child disconnected callback called');
    }

    errorCallback(error, stack) {
        window.alert('Child error callback called, error = ' + JSON.stringify(error) + ', stack = ' + JSON.stringify(stack));
    }

    increaseCount() {
        this.dispatchEvent(new CustomEvent('increasecount', {
            detail: {
                message: 'Increased count to ' + (++this.count)
            }
        }));
    }
}