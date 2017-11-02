inspector - extensions
gtInspectorModelViewIn: composite
	<gtInspectorPresentationOrder: -1>
	^ composite roassal2
		title: '[LIV] Instance Model';
		initializeView: [ | v |
			v := RTView new.
			OPUMLRTInteractiveViewContext setOnView: v.
			self renderIn: v.
			self showDiffIn: v.
			v @ RTDraggableView @ RTZoomableView.
			v ];
	yourself