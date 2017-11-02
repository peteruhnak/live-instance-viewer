building
buildBrowser
	browser := GLMTabulator new.
	browser title: 'History Model Diff'.
	browser
		row: [ :r | 
			r
				column: #left;
				column: #right ];
		row: #diff.
	browser transmit
		to: #left;
		andShow: [ :a :history | (history gtInspectorModelViewIn: a) title: 'Left' ].
	browser transmit
		to: #right;
		andShow: [ :a :history | (history gtInspectorModelViewIn: a) title: 'Right' ].
	browser transmit
		from: #left;
		from: #right;
		to: #diff;
		andShow: [ :a :left :right | 
			a roassal2
				title: 'Model Diff';
				when: [ left isNotNil & right isNotNil ];
				initializeView: [ | v diff colorer |
					v := RTView new.
					OPUMLRTInteractiveViewContext setOnView: v.
					right renderIn: v.
					diff := LIVInstanceModelDiff new diffBetween: left and: right.
					colorer := LIVInstanceDiffColorer new.
					colorer colorAll: diff in: v.
					v @ RTDraggableView @ RTZoomableView.
					v ] ].
	^ browser