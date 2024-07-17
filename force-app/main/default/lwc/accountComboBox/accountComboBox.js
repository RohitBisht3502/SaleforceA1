import { LightningElement,track } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountDetailsController.getAllAccounts';
import getContactsRelatedToAccountId from '@salesforce/apex/AccountDetailsController.getContactsRelatedToAccountId';

const columns=[
    {label: 'Contact Name',fieldName : 'Name'},
    {label: 'Contact Email',fieldName : 'Email'},
];
export default class AccountComboBox extends LightningElement {
    @track value="";
    @track options=[];
    @track showCard=false;
    @track data=[]; // contact data 
    @track columns=columns; // storing data of contact

    connectedCallback(){
        getAllAccounts()
        .then(res=>{
            let arr=[];
            for(var i=0;i<res.length;i++){
                arr.push({label :res[i].Name ,value : res[i].Id})
            }
            this.options=arr;
        })
    }


    handlerChange(event){
        this.showCard=true;
        this.value=event.detail.value;
        window.alert("Id is : "+ this.value);
        getContactsRelatedToAccountId({selectedAccountId : this.value})
        .then(res=>{
            this.data=res;
        })
        .catch(error=>{
            window.alert("error : "+error);
        })
    }
}