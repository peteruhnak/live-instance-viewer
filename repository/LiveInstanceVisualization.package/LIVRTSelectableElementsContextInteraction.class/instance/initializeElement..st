initialization
initializeElement: aView
	self
		assert: [ self presentation notNil ]
		description: 'The presentation has to be set'.
	self initializeSetOfElements: aView elements