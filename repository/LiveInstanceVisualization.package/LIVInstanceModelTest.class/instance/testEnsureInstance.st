tests - adding
testEnsureInstance
	| inst |
	inst := LIVTestItem new.
	self deny: (model specificationFor: inst ifNone: [ false ]).
	model ensureInstanceFor: inst.
	self assert: (model specificationFor: inst) instanceHash equals: inst identityHash