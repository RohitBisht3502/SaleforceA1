import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement {

    error;
    stack;

    constructor(){
        super();
        window.alert('Child Constructer called');
    }

    connectedCallback(){
        window.alert('Child connectedCallback called');
    }

    renderedCallback(){
        window.alert('Child renderedCallback called');
    }

    disconnectedCallback(){
        window.alert('Child disconnectedCallback called');
    }

    errorCallback(error,stack){
        window.alert('Child errorCallback called');
        this.error=error;
        this.stack=stack;
    }
}