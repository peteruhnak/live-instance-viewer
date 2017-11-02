as yet unclassified
view: aView class: aClassDescription
	| b els |
	b := mondrian.
	b view: aView.
	b shape text
		color: Color black;
		text: #selector";
		if: [ :m | m senders isEmpty ] color: Color gray".
	els := b nodes: aClassDescription methods.
	els do: [ :each | self addMenuFor: each ].
	b shape horizontalBezierLine color: Color blue.
	b shape arrowedBezier
		head: RTEmptyArrowHead new;
		color: Color blue.
	b edges
		connectFromAll: [ :s | 
			(aClassDescription thoroughWhichSelectorsReferTo: s selector)
				collect: [ :each | aClassDescription >> each ] ].
	b layout horizontalDominanceTree
		verticalGap: 40;
		horizontalGap: 70.
	b view @ RTZoomableView.
	b build