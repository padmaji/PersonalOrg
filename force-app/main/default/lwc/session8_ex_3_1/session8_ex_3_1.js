import { LightningElement,wire } from 'lwc';
import { registerListener, unregisterAllListeners } from 'c/pubsub'; 

import { CurrentPageReference } from 'lightning/navigation'; 

export default class Session8_ex_3_1 extends LightningElement {

    message;
    @wire(CurrentPageReference) pageRef; 
    connectedCallback()
    {
        console.log('connected is called');
        /*this.register();*/
        registerListener('eventnotify',this.handlepubsub,this);
    }
   /* register()
    {
        console.log('register is called');
        registerListener('eventnotify',this.handlepubsub,this);
    }*/
    handlepubsub(eve)
    {
        console.log('handlepubsub is called');
        console.log('andlepubsub eve',eve);
        this.message=JSON.stringify(eve);
    }
}