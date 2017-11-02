converting
asShape
	| el lbl comp compLbl |
	el := OPUmlCompartmentableShape new.
"	el localStyle: style."
	el modelElement: self.
	lbl := OPUmlTypedElementLabel new.
	lbl
		text:
			(String
				streamContents: [ :stream | 
					name
						ifNotNil: [ stream
								<< name;
								<< ' ' ].
					stream << ': '.
					stream << classifier name ]).
	lbl
		localStyle:
			(OPUmlStyle new
				fontSize: 11;
				fontUnderline: true).
	lbl owningElement: el.
	comp := OPUmlCompartment new.
	comp owningElement: el.
	slots
		keysAndValuesDo: [ :key :value | 
			(compLbl := OPUmlTypedElementLabel new)
				owningElement: comp;
				modelElement: key;
				text:
					(String
						streamContents: [ :stream | 
							stream << key.
							stream << ' = '.
							(value isCollection
								and: [ value allSatisfy: [ :each | each isKindOf: LIVInstanceSpecification ] ])
								ifTrue: [ (stream
										<<
										(value class printString first isVowel
										ifTrue: [ 'an' ]
										ifFalse: [ 'a' ]))
										<< value class printString;
										<< '(size=';
										<< value size;
										<< ')' ]
								ifFalse: [ stream << value printString ] ]) ].
	^ el