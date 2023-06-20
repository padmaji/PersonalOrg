import { LightningElement } from 'lwc';

export default class Session7_ex_3_child extends LightningElement {

    volumeincrease(event)
    {
        /*const ev=new CustomEvent('volinc',{detail:'volume'});
        this.dispatchEvent(ev);*/
        this.dispatchEvent(new CustomEvent('volinc',{detail:'volume'}));
    }
    volumedecrease(event)
    {
       this.dispatchEvent(new CustomEvent('volumedec',{detail:'volume'})); 
    }
    BrightnessIncrese(event)
    {
        this.dispatchEvent(new CustomEvent('brightinc',{detail:'Brightness'}));
    }
    BrightnessDecrese(event)
    {
       this.dispatchEvent(new CustomEvent('brightec',{detail:'Brightness'})); 
    }
}