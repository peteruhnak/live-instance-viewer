removing
removeLinksFrom: sourceObject at: aSlot
	| source removed |
	source := self specificationFor: sourceObject ifNone: [ ^ self ].
	removed := source slots at: aSlot.
	removed isCollection
		ifTrue: [ removed := removed copy.
			(source slots at: aSlot) removeAll.
			removed do: [ :each | self removeInstance: each ] ]
		ifFalse: [ source slots at: aSlot put: nil.
			self removeInstance: removed ]