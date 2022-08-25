<!-- 
    @data_creazione: 17 agosto 2022    
    @version: 1.0.0 
-->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:ns uri="http://agid.it/suap/sections/apertura_esercizio_vicinato" prefix="sapesvi"/>
    <sch:ns uri="http://agid.it/suap/entities/segnalazione_avvio" prefix="esegavv"/>
    <sch:ns uri="http://agid.it/suap/entities/modalita_vendita" prefix="emodven"/>
    <sch:ns uri="http://agid.it/suap/entities/carattere_esercizio" prefix="ecarese"/>
    <sch:ns uri="http://agid.it/suap/entities/settori_merceologici" prefix="esetmer"/>
   
    <sch:include href="../02_entities/ent_modalita_vendita_v1.0.0.sch#modalita_vendita_ab"/>    
    <sch:include href="../02_entities/ent_settori_merceologici_v1.0.0.sch#settori_merceologici_ab"/>
    
    
    <sch:pattern id="carattere_esercizio_ab" abstract="true">
        
        <sch:rule context="$carattere_esercizio">
            <sch:assert id="carattere_esercizio_ab-carattere_esercizio" test="normalize-space(permanente)!='' or normalize-space(stagionale)!='' or normalize-space(temporaneo)!=''"> 
                Almeno uno tra "Permanente", "Stagionale" o "Temporaneo" deve essere selezionato
            </sch:assert>
        </sch:rule>
        
    </sch:pattern>       
    
    <sch:pattern id="carattere_esercizio" abstract="false" is-a="carattere_esercizio_ab">
        <sch:param name="carattere_esercizio" value="ecarese:carattere_esercizio"/>        
    </sch:pattern>
    
    
    <sch:pattern id="segnalazione_avvio_ab" abstract="true">
       
        <sch:rule context="$segnalazione_avvio">
            <sch:assert id="segnalazione_avvio_ab-segnalazione_avvio" test="normalize-space(esercizio_vicinato)!='' or normalize-space(esclusiva_apparecchi_automatici)!=''"> 
                Almeno uno tra "Vicinato" o "Vendita esclusivamente mediante apparecchi automatici" deve essere selezionato
            </sch:assert>           
        </sch:rule>
        
    </sch:pattern>       
    
    <sch:pattern id="segnalazione_avvio" abstract="false" is-a="segnalazione_avvio_ab">
        <sch:param name="segnalazione_avvio" value="esegavv:segnalazione_avvio"/>        
    </sch:pattern>
       
    <sch:pattern id="modalita_vendita" abstract="false" is-a="modalita_vendita_ab">
        <sch:param name="modalita_vendita" value="sapesvi:modalita_vendita"/>        
    </sch:pattern>
    
    
    <sch:pattern id="settori_merceologici" abstract="false" is-a="settori_merceologici_ab">
        <sch:param name="settori_merceologici" value="sapesvi:settori_merceologici"/>        
    </sch:pattern>
</sch:schema>



