roassal - drawing
renderShape: aShape fromShapes: aCollection in: aView
	| pairs |
	pairs := OrderedCollection new.
	aShape modelElement slots
		associationsDo: [ :pair | 
			(pair value isKindOf: LIVInstanceSpecification)
				ifTrue: [ pairs add: pair key -> pair value ].
			(pair value isCollection and: [ pair value allSatisfy: [ :each | each isKindOf: LIVInstanceSpecification ] ])
				ifTrue: [ pair value do: [ :each | pairs add: pair key -> each ] ] ].
	pairs
		do: [ :pair | 
			| key value |
			key := pair key.
			value := pair value.
			aCollection
				detect: [ :each | each modelElement instanceHash = value instanceHash ]
				ifFound: [ :target | 
					| edge |
					edge := OPUmlAssociationEdge new
						source: aShape;
						target: target;
						targetLabel:
							(OPUmlNameLabel new
								text: key asString;
								modelElement: key);
						modelElement: aShape modelElement -> key;
						headDecorator: RTSimpleArrow;
						yourself.
					edge renderIn: aView ]
				ifNone: [ OPUmlTypedElementLabel new
						owningElement: aShape;
						modelElement: key;
						text:
							(String
								streamContents: [ :stream | 
									stream << key.
									stream << ' = ' << value printString ]) ] ]