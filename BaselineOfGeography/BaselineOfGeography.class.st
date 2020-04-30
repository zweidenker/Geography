Class {
	#name : #BaselineOfGeography,
	#superclass : #BaselineOf,
	#category : #BaselineOfGeography
}

{ #category : #baselines }
BaselineOfGeography >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		self geometry: spec.
		spec 
			package: #'Geography-Core' ;
			package: #'Geography-Geometry' with: [
				spec requires: #('Geography-Core' 'Geometry' ) ];
			package: #'Geography-Tests' with: [
				spec requires: #('Geography-Core' ). ].
		spec 
			group: 'Core' with: #('Geography-Core' );
			group: 'default' with: #('Geography-Core' 'Geography-Tests'). ].

]

{ #category : #baselines }
BaselineOfGeography >> geometry: spec [

	spec
		baseline: 'Geometry' with: [ 
			spec 
				repository: 'github://TelescopeSt:v1.1.0/src'].
			
	
]
