as yet unclassified
newState
	self models
		ifEmpty: [ self add: LIVInstanceModel new ]
		ifNotEmpty: [ | newModel |
			self latest history: nil.
			newModel := self latest deepCopy.
			self latest history: self.
			self add: newModel ].
	^ self latest