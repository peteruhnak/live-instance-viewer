baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'UMLShapes'
				with: [ spec repository: 'github://openponk/uml-shapes/repository' ].
			spec
				baseline: 'MetaLinksToolkit'
				with: [ spec repository: 'github://peteruhnak/metalinks-toolkit/repository' ].
			spec
				package: 'LiveInstanceVisualization'
				with: [ spec requires: #('UMLShapes' 'MetaLinksToolkit') ].
			spec group: 'default' with: #('LiveInstanceVisualization') ]