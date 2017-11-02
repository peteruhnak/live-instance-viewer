removing
removeLinkFrom: sourceObject to: targetObject at: aSlot
	| source target |
	source := self specificationFor: sourceObject ifNone: [ ^ self ].
	target := self specificationFor: targetObject ifNone: [ ^ self ].
	(source slots at: aSlot) remove: target.
	self removeInstance: target