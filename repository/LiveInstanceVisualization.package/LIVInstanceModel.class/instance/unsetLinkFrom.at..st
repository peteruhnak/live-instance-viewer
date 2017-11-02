removing
unsetLinkFrom: sourceObject at: aSlot
	| source removed |
	source := self specificationFor: sourceObject ifNone: [ ^ self ].
	removed := source slots at: aSlot.
	source slots at: aSlot put: nil.
	self removeInstance: removed