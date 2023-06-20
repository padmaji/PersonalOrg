import { LightningElement,wire,api } from 'lwc';
import myaccList from '@salesforce/apex/Session4_Ex3_Apex.myaccList';

export default class Session4_Ex3 extends LightningElement {
@wire(myaccList) roop;

    }