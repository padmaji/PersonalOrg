import { LightningElement } from 'lwc';

export default class Session7_ex_2_child extends LightningElement {

    Increaseme(event)
    {
this.dispatchEvent(new CustomEvent('incre',{detail:'volume'}));
    }
    
    decreaseme(event)
    {
       this.dispatchEvent(new CustomEvent('decre',{detail:'volume'})); 
    }
}