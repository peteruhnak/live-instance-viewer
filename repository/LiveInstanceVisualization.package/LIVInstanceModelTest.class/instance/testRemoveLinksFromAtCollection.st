tests - removing
testRemoveLinksFromAtCollection
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model addLinkFrom: container to: item at: #items.
	model removeLinksFrom: container at: #items.
	self assert: ((model specificationFor: container) slots at: #items) asArray equals: #().
	self assert: model elements asArray equals: {model specificationFor: container}