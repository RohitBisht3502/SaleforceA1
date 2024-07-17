import { LightningElement ,api} from 'lwc';

export default class ChildComponent extends LightningElement {
   @api firstName="Rohit Singh Bisht";

   @api handleChangeValue(){
    this.firstName="hii my name is rohu";
   }
}