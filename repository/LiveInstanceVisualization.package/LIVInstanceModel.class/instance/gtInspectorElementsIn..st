as yet unclassified
gtInspectorElementsIn: composite
	<gtInspectorPresentationOrder: 1>
	composite fastTable
		title: 'Elements';
		display: [ self elements ];
		enableElementIndex;
		column: 'Index' evaluated: [ :value :index | index asString ] width: 40;
		column: 'Element' evaluated: [ :value | value asString ]