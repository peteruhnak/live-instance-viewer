running
setupBuilder: aBuilder
	aBuilder
		addSpec: [ :spec | 
			spec classifier: LIVTestContainer.
			spec name: #identityHash.
			spec addSlot: #items -> [ OrderedCollection new ] ].
	aBuilder
		addSpec: [ :spec | 
			spec classifier: LIVTestItem.
			spec name: #identityHash.
			spec addSlot: #container -> nil ]