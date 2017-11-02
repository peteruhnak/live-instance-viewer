printing
printOn: aStream
	aStream
		<< 'InstSpec';
		<< '(';
		<< self name;
		<< ' : ';
		<< self classifier name;
		<< ')'