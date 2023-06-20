import { LightningElement } from 'lwc';

export default class Session7_ex_3_parent extends LightningElement {

cont='waiting for the button to click';
val=0;
evvolinc(event)
{
    console.log('val before this.val=0',this.val);
    this.val=0;
    console.log('val after this.val=0',this.val);
this.cont=event.detail;
if(this.val>=0 && this.val<100)
{
this.val=this.val+1;
}
}
evvoldec(event)
{
    
    this.cont=event.detail;
    if(this.val>0 && this.val<100)
    {
        this.val=this.val-1;
    }
}
evbriginc(event)
{
    this.cont=event.detail;
    if(this.val>=0 && this.val<100)
    {
        this.val=this.val+1;
    }
}
evbrigdec(event)
{
    this.cont=event.detail;
    if(this.val>0 && this.val<100)
    {
    this.val=this.val-1;
    }   
}
}