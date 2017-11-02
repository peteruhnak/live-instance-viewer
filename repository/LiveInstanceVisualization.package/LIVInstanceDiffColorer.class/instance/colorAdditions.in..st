as yet unclassified
colorAdditions: aCollection in: aView
	| els |
	els := (self diagramElementsIn: aView)
		select: [ :each | aCollection includes: each model modelElement ].
	els
		do: [ :el | 
			| fig |
			fig := el model.
			fig style fillColor: Color green muchLighter.
			fig update.
			fig sourceEdges , fig targetEdges
				do: [ :each | 
					each ownedElements
						do: [ :lbl | 
							lbl style fontColor: Color green muchDarker.
							lbl update ].
					each localStyle strokeColor: Color green muchDarker.
					each update ] ]