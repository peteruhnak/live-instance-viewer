as yet unclassified
colorAll: aDictionary in: aView
	self colorAdditions: (aDictionary at: #added) in: aView.
	self colorModifications: (aDictionary at: #modified) in: aView.
	self colorRemovals: (aDictionary at: #removed) in: aView