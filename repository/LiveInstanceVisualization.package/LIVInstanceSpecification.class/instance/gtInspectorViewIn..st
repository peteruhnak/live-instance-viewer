ui
gtInspectorViewIn: composite
	<gtInspectorPresentationOrder: 1>
	composite roassal2
		title: 'Instance';
		initializeView: [ | v |
			v := RTView new.
			OPUMLRTInteractiveViewContext setOnView: v.
			self asShape renderIn: v.
			v @ RTDraggableView @ RTZoomableView.
			v ]