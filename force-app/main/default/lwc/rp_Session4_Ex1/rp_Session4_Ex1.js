import { LightningElement,api } from 'lwc';
import Industry_FIELD from '@salesforce/schema/Account.Industry'; 
import Name_Field from '@salesforce/schema/Account.Name';
//import Pan_FIELD from '@salesforce/schema/Account.PAN_Number__c';
//import location_FIELD from '@salesforce/schema/Account.NumberofLocations__c';
//import Location_FIELD from '@salesforce/schema/Hiring_Manager__c.Location__c';

export default class Rp_Session4_Ex1 extends LightningElement {

    @api recordId;
    @api objectApiName;
    //filed1=Industry_FIELD;
    //field2=Pan_FIELD;
    //field3=Location_FIELD;
    //field1=Location_FIELD;
    Mycustomfields=[Industry_FIELD,Name_Field];
    

}