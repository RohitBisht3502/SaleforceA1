
import { LightningElement,track } from 'lwc';
import getContactRelatedToAccountId from '@salesforce/apex/AccountDetailsController.getContactRelatedToAccountId';
import getAllAccounts from '@salesforce/apex/AccountDetailsController.getAllAccounts';
const columns=[
    {label : 'First Name'  , fieldName : 'FirstName'},
    {label : 'Last Name'   , fieldName : 'LastName' },
    {label : 'Email'       , fieldName : 'Email'    },
    {label : 'Phone'       , fieldName : 'Phone'},
    {label : 'Description' , fieldName : 'Description'},
    {label : 'Department'  , fieldName : 'Department'},
];
export default class AccountAssignment1 extends LightningElement {
    @track value=""; 
    @track options=[]; 
    @track showCard=false;
    @track data=[]; 
    @track columns=columns; 

    connectedCallback(){
        window.alert('connected call back fetchig data');
        
    }

    


    handlerChange(event){
        getAllAccounts()
        .then(res=>{
            let arr=[];
            for(var i=0;i<res.length;i++){
                arr.push({label :res[i].Name ,value : res[i].Id})
            }
            this.options=arr;
        })
        this.showCard=true;
        this.value=event.detail.value;
        window.alert("Id is : "+ this.value);
        getContactRelatedToAccountId({selectedAccountId : this.value})
        .then(res=>{
            this.data=res;
        })
        .catch(error=>{
            window.alert("error : "+error);
        })
    }
}