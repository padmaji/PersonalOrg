import { LightningElement } from 'lwc';

export default class Session7_ex_2_parent extends LightningElement {
con='waiting for the button click';
val=0;

evntincre(event)
{
    this.con=event.detail;
if(this.val>=0 && this.val<100)
{

this.val=this.val+1;
}
}
evntdecr(event)
{
    this.con=event.detail;
if(this.val>0 && this.val<100)
{
this.val=this.val-1;
}
}
}