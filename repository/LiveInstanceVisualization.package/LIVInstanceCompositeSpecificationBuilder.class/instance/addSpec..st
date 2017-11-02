adding
addSpec: aOneArgBlock
	| spec |
	spec := LIVInstanceSpecificationBuilder new.
	aOneArgBlock value: spec.
	specs add: spec