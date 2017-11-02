as yet unclassified
limitedShapeFor: anObject
	| el comp |
	el := self baseShapeFor: anObject named: anObject name , ' : ' , anObject class name.
	comp := OPUmlCompartment new.
	comp owningElement: el.
	#(id , name)
		select: [ :each | anObject class hasInstVarNamed: each ]
		thenDo: [ :key | 
			| text |
			text := key , (self textFor: (anObject instVarNamed: key) of: anObject).
			(self labelFor: key withText: text) owningElement: comp ].
	^ el