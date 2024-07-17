import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Title from '@salesforce/schema/Contact.Title';
export default class BikeCard extends LightningElement {
    name ='Utilaranytian labs';
    description = 'Hello guys this comapany totaly works in salesforce fields';
    category = 'Software developer';
    material = 'Laptops';
    price = '$2500';
    pictureUrl='https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
    clickHandler(){
        this.showToast();
    }

    //arrow function and how to return it in lwc

    connectedCallback(){
        let res=this.myFunction(20,5);
        window.alert("res : "+res);
    }

    /*// simple function
    myFunction(dividened,divisor){
        return (dividened/divisor);

    } */
    // arrow function
    myFunction=(dividend,divisor)=>{
        return (dividend/divisor);
    }
    showToast(){
        const event=new ShowToastEvent({
            title : "Great : ",
            message : "You win the bike x pulse 200 4v ",
            variant : "success"
        })
    }
}