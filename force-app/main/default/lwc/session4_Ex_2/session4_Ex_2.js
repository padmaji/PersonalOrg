import { LightningElement,api } from 'lwc';
import Name_field from '@salesforce/schema/Account.Name';
import Phone_field from '@salesforce/schema/Account.Phone';
import fax_field from '@salesforce/schema/Account.Fax';
import Industry_field  from '@salesforce/schema/Account.Industry';


export default class Session4_Ex_2 extends LightningElement {
@api recordId;
mycustomeFields=[Name_field,Phone_field,fax_field,Industry_field];

}