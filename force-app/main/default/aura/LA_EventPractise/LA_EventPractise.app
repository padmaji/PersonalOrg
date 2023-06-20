<aura:application extends="force:slds" >
    <aura:handler name="firsty"  event="c:LE_Practise_R" action="{!handleMe}" />
    <lightning:card title="A2Application green card">
    <lightning:layout>
        <lightning:layoutitem size="6">
            <c:LC_Practise_R_C1_yellow />
        </lightning:layoutitem>
        <lightning:layoutitem>
            <c:LC_Practise_R_C2_yellow/>
        </lightning:layoutitem>
        </lightning:layout>
    
    </lightning:card>
	
</aura:application>