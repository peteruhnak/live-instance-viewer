as yet unclassified
shapesFor: anObject
	| primaryShape referencedObjects values secondaryShapes references ref refObjects refCollections |
	values := self valuesOf: anObject.
	ref := values associations
		select: [ :pair | self isReferenceValue: pair value of: anObject ].
	refObjects := ref reject: [ :pair | pair value isCollection ] thenCollect: #value.
	refCollections := (ref select: [ :pair | pair value isCollection ]) flatCollect: #value.
	primaryShape := self shapeFor: anObject.
	references := RTGroup new.
	secondaryShapes := RTGroup new.
	refObjects
		collect: [ :each | 
			| shape |
			shape := self shapeFor: each.
			secondaryShapes add: shape.
			references add: (self referenceShapeFrom: primaryShape to: shape) ].
	refCollections
		collect: [ :each | 
			| shape |
			shape := self limitedShapeFor: each.
			secondaryShapes add: shape.
			references add: (self referenceShapeFrom: primaryShape to: shape) ].
	^ (secondaryShapes , {primaryShape}) -> references