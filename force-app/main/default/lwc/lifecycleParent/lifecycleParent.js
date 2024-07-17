import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    error;
    stack;

    constructor(){
        super();
        window.alert('Parent Constructer called');
    }

    connectedCallback(){
        window.alert('Parent connectedCallback called');
    }

    renderedCallback(){
        window.alert('Parent renderedCallback called');
    }

    disconnectedCallback(){
        window.alert('Parent disconnectedCallback called');
    }

    errorCallback(error,stack){
        window.alert('Parent errorCallback called');
        this.error=error;
        this.stack=stack;
    }
}