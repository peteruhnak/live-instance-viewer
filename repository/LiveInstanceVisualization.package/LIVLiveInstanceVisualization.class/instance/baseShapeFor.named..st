shapes
baseShapeFor: anObject named: aString
	| el |
	el := OPUmlClassifierShape new.
	OPUmlNameLabel new
		text: aString;
		localStyle: (OPUmlStyle new fontSize: 11; fontUnderline: true);
		owningElement: el.
	el modelElement: anObject.
	^ el