tests - removing
testRemoveLinksFromAtDirect
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model setLinkFrom: item to: container at: #container.
	model removeLinksFrom: item at: #container.
	self assert: ((model specificationFor: item) slots at: #container) equals: nil.
	self assert: model elements asArray equals: {model specificationFor: item}