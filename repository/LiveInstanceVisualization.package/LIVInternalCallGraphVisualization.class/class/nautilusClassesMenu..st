as yet unclassified
nautilusClassesMenu: aBuilder
	<contextMenu>
	<nautilusGlobalClassMenu>
	| target |
	target := aBuilder model.
	target selectedClass ifNil: [ ^ target ].
	(aBuilder item: #'Inspect')
		action: [ target selectedClass  inspect ];
		order: -99;
		withSeparatorAfter.