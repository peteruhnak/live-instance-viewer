as yet unclassified
shapeFor: anObject
	| el comp values |
	el := self baseShapeFor: anObject named: anObject name , ' : ' , anObject class name.
	comp := OPUmlCompartment new.
	comp owningElement: el.
	values := self valuesOf: anObject.
	values keysAndValuesDo: [ :key :value |
			| text |
			text := key , (self textFor: value of: anObject).
			(self labelFor: value withText: text) owningElement: comp ].
	values associations
		select: [ :pair | self isReferenceValue: pair value of: anObject ]
		thenDo: [ :pair | 
			comp ownedElements
				detect: [ :each | each modelElement = pair value ]
				ifFound: [ :each | each localStyle: (OPUmlStyle new fontColor: Color blue) ] ].
	^ el