roassal - drawing
renderIn: aView
	| shapes |
	shapes := (elements collect: #asShape) asGroup.
	shapes
		do: [ :each | 
			each renderIn: aView.
			each rtElement
				when: TRMouseRightClick
				do: [ :evt | self applyFocusedLayoutIn: aView on: (shapes collect: #rtElement) focus: evt element ].
			each rtElement when: TRMouseLeftClick do: [ :evt |  ].
"			self addMenuFor: each."
			each rtElement @ RTResizable @ RTDraggable ].
	shapes do: [ :each | self renderShape: each fromShapes: shapes in: aView ].
	RTHorizontalFlowLayout new
		gapSize: 50;
		on: shapes