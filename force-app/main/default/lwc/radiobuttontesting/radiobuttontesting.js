import { LightningElement } from 'lwc';
export default class Radiobuttontesting extends LightningElement {
    value = '';

    get options() {
        return [
            { label: 'Sales', value: 'option1' },
            { label: 'Force', value: 'option2' },
        ];
    }
radiobuttonchange(event)
{
    consol.log('radio button is clicked');
}
}