baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				project: 'DeepTraverser'
				with: [ spec
						className: #ConfigurationOfDeepTraverser2;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/Moose/DeepTraverser/main' ].
			spec
				baseline: 'UMLShapes'
				with: [ spec repository: 'github://openponk/uml-shapes/repository' ].
			spec
				baseline: 'MetaLinksToolkit'
				with: [ spec repository: 'github://peteruhnak/metalinks-toolkit/repository' ].
			spec
				package: 'LiveInstanceVisualization'
				with: [ spec requires: #('UMLShapes' 'MetaLinksToolkit' 'DeepTraverser') ].
			spec group: 'default' with: #('LiveInstanceVisualization') ]