ui
gtInspectorViewIn: composite
	<gtInspectorPresentationOrder: 1>
	composite roassal2
		title: 'Instance';
		initializeView: [ | v |
			v := RTView new.
			LIVRTInteractiveViewContext setOnView: v.
			self asShape renderIn: v.
			v @ RTDraggableView @ RTZoomableView.
			v ]