*LiveInstanceVisualization-Inspector-Extensions
gtInspectorInstanceViewIn: composite
	<gtInspectorPresentationOrder: 80>
	| el |
	composite roassal2
		title: '[LIV] Calls graph';
		initializeView: [ | v |
			v := RTView new.
			el := LIVInternalCallGraphVisualization new view: v class: self.
			v @ RTDraggableView.
			v ]