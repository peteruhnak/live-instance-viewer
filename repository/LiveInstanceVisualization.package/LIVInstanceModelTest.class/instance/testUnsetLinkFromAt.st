tests - removing
testUnsetLinkFromAt
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model setLinkFrom: item to: container at: #container.
	model unsetLinkFrom: item at: #container.
	self assert: ((model specificationFor: item) slots at: #container) equals: nil