running
setUp
	| specBuilder history |
	super setUp.
	specBuilder := LIVInstanceCompositeSpecificationBuilder new.
	self setupBuilder: specBuilder.
	history := LIVInstanceHistory new.
	history specificationBuilder: specBuilder.
	model := history newState