tests - adding
testAddLinkFromToAt
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model addLinkFrom: container to: item at: #items.
	self
		assert: ((model specificationFor: container) slots at: #items) asArray
		equals: {model specificationFor: item}