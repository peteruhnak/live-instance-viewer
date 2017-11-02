tests - printing
testPrintOn
	spec name: 'item'.
	spec classifier: LIVTestItem.
	self assert: spec printString equals: 'InstSpec(item : LIVTestItem)'