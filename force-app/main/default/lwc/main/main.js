import { LightningElement} from 'lwc';

export default class ButtonBasic extends LightningElement {
    
  num1=0;
  num2=0;
  res=0;
        

    changeHandler(event){
        debugger;
        const a=event.target.label;
        if(a=='Enter 1st Number'){
            this.num1=event.target.value;
        }else if(a=='Enter 2nd Number'){
            this.num2=event.target.value;
        }
    }
    
    adding(){
        this.res= parseInt(this.num1)+parseInt(this.num2);
        console.log(res);
    
    }

    s
    0

    multiplying(){
        this.res= this.num1*this.num2;
        console.log(res);
    
    }

    dividing(){
        this.res= this.num1/this.num2;
        console.log(res);
    
    }
    
}