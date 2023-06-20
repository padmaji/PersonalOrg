import { LightningElement } from 'lwc';

export default class UpdatedPersonalCalculator extends LightningElement {
environment=[{label:"Hybrid (Desktop+Cloud)",value:"Hybrid"},{label:"SaaS(Cloud Only)-Cloud Workspace/PLEXOS",value:"SaaS"}];

value=[];

licensed=[{label:'electric',value:'electric'},{label:'gas',value:'gas'},{label:'water',value:'water'},{label:'nodal',value:'nodal'}];

plexos=[{label:'PLEXOS Cloud Connect',value:'PLEXOS Cloud Connect'},{label:'PLEXOS Cloud',value:'PLEXOS Cloud'}];

AdditionalCores=[{label:0,value:0},{label:16,value:16},{label:32,value:32},{label:48,value:48},{label:64,value:64},{label:80,value:80},{label:96,value:96},{lable:112,value:112}];

storage=[{label:1,value:1},{label:5,value:5},{label:10,value:10},{label:20,value:20}];

plexosclod=[{label:'PLEXOS CLOUD PLATFORM',value:'PLEXOS CLOUD PLATFORM'},{label:'PREMIUM BI',value:'PREMIUM BI'}];

}