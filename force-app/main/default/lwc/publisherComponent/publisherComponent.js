import { LightningElement, wire } from "lwc";

//1. Importing the named imports 
//[library to publish data and the message channel]

import { publish, MessageContext,subscribe,unsubscribe,} from "lightning/messageService";
import ACCOUNT_CHANNEL from "@salesforce/messageChannel/AccountData__c";

export default class PublisherComponent extends LightningElement {
    //2. Wiring the MessageContext to a property
    @wire(MessageContext)
    messageContext;
    receivedMessage;
    subscription = null;
    txt;


    constructor()
    {
        super();
    }
    //3. Handling the user input.
    //which in our case is going to be a button click

    inputchange(event)
    {
this.txt=event.detail.value;
    }

    publishme() {
        /*const messaage = {
            recordId: "001xx000003NGSFAA4",
            name: "Burlington Textiles of America"
        };*/

        const messaage={
            recordId:this.txt,
            name:"Message from LWC"
        };

        //4. Publishing the message
        publish(this.messageContext, ACCOUNT_CHANNEL, messaage);
    }
    subscribeMC()
    {
        console.log('lwc publisher is entered');
    if (this.subscription) {
        console.log('lwc publisher is entered is entered');
        return;
    }
    console.log('lwc publsiher after else block');
    this.subscription = subscribe(this.messageContext, ACCOUNT_CHANNEL, (message) => {
        this.displayMessage(message);
    });
 }

 unsubscribeMC() {
     unsubscribe(this.subscription);
     this.subscription = null;
 }

 displayMessage(message) {
    /*console.log('Entered into display message of lwc publisher');
    console.log('message---->',message);
    console.log('typeof',typeof(message));
    console.log('message object fileds ',message["Destination"]);
    console.log('message object fileds ',message.Destination);*/
    if(message.Destination=='L')
    {
     this.receivedMessage = message ? JSON.stringify(message, null, '\t') : 'no message payload';
    }
    else if(message.Destination=='AL')
    {
        this.receivedMessage =this.receivedMessage = message ? JSON.stringify(message, null, '\t') : 'no message payload';
    }
    else{
        this.receivedMessage ='';
    }
 }
 handleClear() {
    this.receivedMessage = null;
}
}