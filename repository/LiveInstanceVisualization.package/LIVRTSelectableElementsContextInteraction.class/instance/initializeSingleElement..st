initialization
initializeSingleElement: each
	^ each
		when: TRMouseLeftClick
		do: [ :event | 
			each model
				ifNotNil: [ :m | 
					| selection |
					selection := (m respondsTo: #modelElement)
						ifTrue: [ m modelElement ]
						ifFalse: [ m model modelElement ].
					selection isSymbol ifTrue: [ 
						selection := each model owningElement owningElement modelElement slots at: selection
					].
					self presentation selection: selection ] ]