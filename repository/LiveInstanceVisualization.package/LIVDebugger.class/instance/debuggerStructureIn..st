building
debuggerStructureIn: browser
	
	browser
		row: #stack;
		row: [ :c | c
			column: #code;
			column: #view ] span: 2;
		row: #inspector.