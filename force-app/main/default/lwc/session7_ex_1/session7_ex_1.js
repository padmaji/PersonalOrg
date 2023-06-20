import { LightningElement } from 'lwc';

export default class Session7_ex_1 extends LightningElement {
    increaseme(event)
    {
const evt=new CustomEvent('incre');
this.dispatchEvent(evt);
    }
    decreaseme(event)
    {
this.dispatchEvent( new CustomEvent('decre'));
    }

}