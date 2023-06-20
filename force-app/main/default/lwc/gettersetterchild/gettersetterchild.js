import { LightningElement,track } from 'lwc';

export default class Gettersetterchild extends LightningElement {

    defaultMsg = "We are learning ";
    @track outputMessage;
 
       
    get message(){
        console.log('deafult message is');
        return this.defaultMsg + "Lightning Web Component";
         
    }
 
    set message(val){
        console.log('output message before'+this.outputMessage);
       this.outputMessage = val;
       console.log('output message After'+this.outputMessage);
    }
 
    handleMessage(event){
        console.log('handleMessage before'+this.message);
        this.message = event.target.value;
        console.log('handleMessage After'+this.message);
    }
}