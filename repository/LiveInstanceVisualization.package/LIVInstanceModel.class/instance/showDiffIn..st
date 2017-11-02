roassal - drawing
showDiffIn: aView
	history ifNil: [ ^ self ].
	(history models before: self ifAbsent: [ nil ])
		ifNotNil: [ :old | 
			| diff colorer |
			diff := LIVInstanceModelDiff new diffBetween: old and: self.
			colorer := LIVInstanceDiffColorer new.
			colorer colorAll: diff in: aView ]