baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'UMLShapes'
				with: [ spec repository: 'github://openponk/uml-shapes/repository' ].
			spec package: 'LiveInstanceVisualization' with: [ spec requires: #('UMLShapes') ].
			spec group: 'default' with: #('LiveInstanceVisualization') ]