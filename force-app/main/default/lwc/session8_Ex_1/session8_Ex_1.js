import { LightningElement } from 'lwc';

export default class Session8_Ex_1 extends LightningElement {

    increase(event)
    {
this.dispatchEvent(new CustomEvent('Increase',{detail:'volume',bubbles:true,composed:true}));
    }
    decrease(event)
    {
       this.dispatchEvent(new CustomEvent('decrease',{detail:'volume'})); 
    }

}