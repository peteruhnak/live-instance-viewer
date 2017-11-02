tests - adding
testSetValueFromToAt
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model setValueFrom: item to: container at: #container.
	self assert: ((model specificationFor: item) slots at: #container) equals: container