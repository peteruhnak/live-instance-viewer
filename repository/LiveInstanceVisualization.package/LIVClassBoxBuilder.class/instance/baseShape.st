shapes
baseShape
	^ baseShape ifNil: [ baseShape := self newBaseShape ]