as yet unclassified
exampleWithMetalinks
	<playground>
| history wrapperSpec modelSpec wrapSelectorLink wrapInstanceLink cmInitLink cmSpecLink links |
history := LIVInstanceHistory new.
history add: (LIVInstanceModel new).

"added to SpecWrapper>>instance:selector: #after"
(wrapperSpec := LIVInstanceSpecificationBuilder new)
	name: [ :obj | obj hash asString ];
	addFromAssociation: #selector -> nil;
	addFromAssociation: #instance -> nil.

"added to ComposableModel>>#initialize #before"
(modelSpec := LIVInstanceSpecificationBuilder new)
	name: [ :obj | obj hash asString ];
	addFromAssociation: #spec -> nil.

(wrapSelectorLink := MTMetaLinkUser new)
	target: SpecWrapper>>#selector:;
	control: #after;
	action: [ :object |
		history newState in: [ :model |
			(model specificationFor: object ifAbsentPut: [ wrapperSpec instanceOn: object ])
				slots at: #selector put: object selector
		]
	].	

(wrapInstanceLink := MTMetaLinkUser new)
	target: SpecWrapper>>#instance:;
	control: #after;
	action: [ :object |
		history newState in: [ :model | |objectModel|
			objectModel := model specificationFor: object ifAbsentPut: [ wrapperSpec instanceOn: object ].
			(object instance isKindOf: ComposableModel) ifTrue: [ 
			objectModel slots at: #instance put: (model specificationFor: object instance ifAbsentPut: [ modelSpec instanceOn: object instance]) ]
		ifFalse: [ objectModel slots at: #instance put: object instance printString ]
			]
	].


(cmInitLink := MTMetaLinkUser new)
	target: ComposableModel>>#initialize;
	control: #before;
	action: [ :object |
		history newState add: (modelSpec instanceOn: object)
	].

(cmSpecLink := MTMetaLinkUser new)
	target: ComposableModel>>#spec:;
	control: #after;
	action: [ :object |
		history newState in: [ :model |
			(model specificationFor: object) in: [ :instSpec |
				instSpec slots at: #spec put: (model specificationFor: object spec ifAbsentPut: [ wrapperSpec instanceOn: object spec])
			].
		].
	].

links := { 
	wrapSelectorLink.
	wrapInstanceLink.
	cmInitLink.
	cmSpecLink.
}.

links do: #install.

history inspect.

"
links do: #uninstall.
"