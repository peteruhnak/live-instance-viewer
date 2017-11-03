initialization
testScenario
	| history |
	scenario installLinks.
	history := scenario history.
	self assert: history models asArray equals: #().
	scenario runScenario.
	self assert: history models size > 0.
	self assert: history models last elements size > 0