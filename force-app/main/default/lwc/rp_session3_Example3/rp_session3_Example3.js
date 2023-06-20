import { LightningElement } from 'lwc';

export default class Rp_session3_Example3 extends LightningElement {
    fn;
    sn;
    result;
     fnonchange(event)
    {

        console.log('fonchange is fired');
        if(event.target.name==='fn')
        {
            this.fn=event.target.value;
            console.log('fn is',this.fn);
        }
        else if(event.target.name==='sn')
        {
            this.sn=event.target.value;
            console.log('sn is ',this.sn);
        }

    }
   /* snonchnage(event)
    {
        this.sn=parseInt(event.target.value);
    }*/
    get sumoftwonumber()
    {
        console.log('getter is fired',this.fn,this.sn);
        return parseInt(this.fn)+parseInt(this.sn);
    }


}