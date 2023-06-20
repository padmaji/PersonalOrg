import { LightningElement } from 'lwc';

export default class Session7_ex_1_parent extends LightningElement 
{

vol=0;
evincrevol(event)
{
    this.val=0;
if(this.vol>=0 && this.vol<100)
{
this.vol=this.vol+1;
}
}
evdecvol(event)
{
if(this.vol>=0 && this.vol<100)  
{
    this.val=0;
this.vol=this.vol-1;
}
}
}