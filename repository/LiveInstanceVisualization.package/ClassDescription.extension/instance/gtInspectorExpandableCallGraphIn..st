*LiveInstanceVisualization-Inspector-Extensions
gtInspectorExpandableCallGraphIn: composite
	<gtInspectorPresentationOrder: 80>
	| el |
	composite roassal2
		title: '[LIVE] Calls graph';
		initializeView: [ | v |
			v := RTView new.
			el := LIVExpandableCallGraphVisualization new view: v class: self.
			v @ RTDraggableView.
			v ]