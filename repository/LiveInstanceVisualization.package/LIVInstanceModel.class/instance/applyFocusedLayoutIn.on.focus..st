roassal - drawing
applyFocusedLayoutIn: aView on: shapes focus: aFocus
	| distance circles els enableCircles |
	distance := 400.
	enableCircles := true.
	enableCircles
		ifTrue: [ (aView hasAttribute: #circles)
				ifTrue: [ circles := aView attributeAt: #circles ]
				ifFalse: [ circles := RTEllipse new
						color: Color transparent;
						borderWidth: 1;
						borderColor: Color red;
						size: [ :m | distance * m ];
						elementsOn: (1 to: 4).
					aView addAll: circles.
					circles do: [ :each | each trachelShape pushBack ].
					circles translateTo: aFocus position.
					aView attributeAt: #circles put: circles ] ].
	els := shapes.
	enableCircles
		ifTrue: [ RTSmoothLayoutTranslator new
				nbCycles: 1;
				translate: circles to: aFocus position ].
	LaFocusedRadialLayout new
		radius: distance / 2;
		setFocus: aFocus nodes: els edges: #();
		apply