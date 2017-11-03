as yet unclassified
installLinks
modelDefs := LIVInstanceCompositeSpecificationBuilder new.
modelDefs addSpec: [ :spec |
	spec classifier: LIVTestContainer.
	spec name: #identityHash.
	spec
		addSlot: #items -> [ OrderedCollection new ].
].
modelDefs addSpec: [ :spec |
	spec classifier: LIVTestItem.
	spec name: #identityHash.
	spec
		addSlot: #name -> nil;
		addSlot: #timeCreated -> [ Time now ];
		addSlot: #timeAdded -> nil;
		addSlot: #container -> nil.
].

history := LIVInstanceHistory new.
LIVDebugSession modelHistory: history.
history specificationBuilder: modelDefs.

links := MTMetaLinkRegistration new.

links addLink: [ :link |
link
	target: LIVTestItem>>#initialize;
	control: #before;
	action: [ :object |
		history inNewState: [ :model | model ensureInstanceFor: object ]
	]
].

links addLink: [ :link |	
link
	target: LIVTestItem>>#name:;
	action: [ :object :arguments |
		history inNewState: [ :model |
			model setValueFrom: object to: arguments first at: #name
		]
	]
].

links addLink: [ :link |
link
	target: LIVTestItem>>#container:;
	action: [ :object :arguments |
		history inNewState: [ :model |
			arguments first
				ifNil: [ 	model unsetLinkFrom: object at: #container ]
				ifNotNil: [ model setLinkFrom: object to: arguments first at: #container ]
		]
	]
].

links addLink: [ :link |
link
	target: LIVTestContainer>>#initialize;
	control: #before;
	action: [ :object |
		history inNewState: [ :model | model ensureInstanceFor: object ]
	]
].

links addLink: [ :link |
link
	target: LIVTestContainer>>#addItem:;
	action: [ :object :arguments |
		history inNewState: [ :model |
			model addLinkFrom: object to: arguments first at: #items.
			model setValueFrom: arguments first to: Time now at: #timeAdded.
"			model addLinkFrom: object to: arguments first name -> Date new at: #allItems."
		]
	]
].

links addLink: [ :link |
link
	target: LIVTestContainer>>#removeItem:;
	action: [ :object :arguments |
		history inNewState: [ :model |
			model removeLinkFrom: object to: arguments first at: #items.
		]
	]
].
	
links install.

"Open tools if needed
LIVDiffBrowser openOn: history.
history inspect.
"

"
links uninstall
"