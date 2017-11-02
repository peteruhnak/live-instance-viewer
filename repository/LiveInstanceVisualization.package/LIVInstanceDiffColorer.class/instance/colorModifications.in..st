as yet unclassified
colorModifications: aDictionary in: aView
	aDictionary
		keysAndValuesDo: [ :hash :dict | 
			| el fig subFigs |
			el := aView elements
				detect: [ :each | 
					(each model modelElement isKindOf: LIVInstanceSpecification)
						and: [ each model modelElement instanceHash = hash ] ].
			fig := el model.
			subFigs := fig deepCollect: #ownedElements.
			(dict at: #added)
				keysAndValuesDo: [ :key :value | 
					subFigs
						detect: [ :each | each modelElement = key ]
						ifFound: [ :each | 
							each style fontColor: Color green muchDarker.
							each update ] ].
			(dict at: #modified)
				keysAndValuesDo: [ :key :value | 
					subFigs
						detect: [ :each | each modelElement = key ]
						ifFound: [ :each | 
							each style fontColor: Color blue.
							each update ].
					aView edges
						detect: [ :each | 
							(each model isKindOf: OPUmlEdge)
								and: [ each model modelElement = (fig modelElement -> key) ] ]
						ifFound: [ :each | 
							each model ownedElements
								detect: [ :lbl | lbl modelElement = key ]
								ifFound: [ :lbl | 
									lbl style fontColor: Color blue.
									lbl update ].
							each model localStyle strokeColor: Color blue.
							each model update ] ] ]