tests - adding
testSetLinkFromToAt
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model setLinkFrom: item to: container at: #container.
	self
		assert: ((model specificationFor: item) slots at: #container)
		equals: (model specificationFor: container)