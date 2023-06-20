import { LightningElement } from 'lwc';

export default class Rp_session1_Example1 extends LightningElement {

    nam;
    inpchange(ev)
    {
        this.nam=ev.target.value;
    }
    submitinp()
    {
        alert('text inp is changed'+this.nam);
    }

}