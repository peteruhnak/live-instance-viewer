hooks
initializeElement: aView
	self assert: [ self presentation notNil ] description: 'The presentation has to be set'.
	aView elements
		do: [ :each | 
			each
				when: TRMouseLeftClick
				do: [ :event | 
					(each model isNotNil
						and: [ (each model respondsTo: #modelElement) and: [ each model modelElement isNotNil ] ])
						ifTrue: [ self presentation selection: each model modelElement ] ] ]