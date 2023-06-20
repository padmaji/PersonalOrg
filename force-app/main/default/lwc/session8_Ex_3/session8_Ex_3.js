import { LightningElement,wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { fireEvent } from 'c/pubsub'; 


export default class Session8_Ex_3 extends LightningElement {
    
    msg;
    @wire(CurrentPageReference) pageRef; 
    input(event)
    {
this.msg=event.target.value;
console.log('the input on chnage val is',this.msg);
    }

    submit(event)
    {
      console.log('The submit button is clicked');
      let messag={
        'message':this.msg,
        'Sender Name':'Padmaji',
        'Sender City':'Hyderabad'
      };
      //const b=JSON
      console.log('stringy the message');
      const a=JSON.stringify(messag);
console.log('stringified the message');
      console.log('The message is',a);
      console.log('The message is',this.a);

        fireEvent(this.pageRef,'eventnotify',messag);
        console.log('the fire event is passesd');
    }


}