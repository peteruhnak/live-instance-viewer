as yet unclassified
wipExample
	| m dir f doc els edges v |
	m
		ifNil: [ dir := FileLocator D / 'prog' / 'normalized-systems'.
			f := dir / 'branchBankingCompV2-1.0.xml'.
			doc := XMLDOMParser parse: f contents.
			m := NSPXMLInterchange new importFromDocument: doc ].
	els := LIVLiveInstanceVisualization new shapesFor: m.
	edges := els value.
	els := els key.
	v := RTView new.
	els
		do: [ :each | 
			each renderIn: v.
			each rtElement @ RTDraggable ].
	edges do: [ :each | each renderIn: v ].

	"RTHorizontalTreeLayout on: (els collect: #rtElement)."
	RTRadialTreeLayout new
		horizontalGap: 300;
		verticalGap: 400;
		on: (els collect: #rtElement).

	"el rtElement @ RTResizable @ RTDraggable."
	v @ RTDraggableView @ RTZoomableView