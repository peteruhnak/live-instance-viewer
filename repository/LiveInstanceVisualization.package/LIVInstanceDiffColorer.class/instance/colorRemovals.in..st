as yet unclassified
colorRemovals: aCollection in: aView
	| els |
	els := (self diagramElementsIn: aView)
		select: [ :each | aCollection includes: each model modelElement ].
	els
		do: [ :el | 
			| fig |
			fig := el model.
			fig style fillColor: Color red muchLighter.
			fig update ]