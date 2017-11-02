as yet unclassified
gtInspectorModelViewIn: composite
	<gtInspectorPresentationOrder: 1>
	^composite fastTable
		title: 'Models';
		display: [ self filterDuplicates: self models ];
		enableElementIndex;
		column: 'Index' evaluated: [ :value :index | index asString ] width: 40;
		column: 'Model' evaluated: [ :value | value asString ];
		column: 'Elements' evaluated: [ :value | value elements size ]