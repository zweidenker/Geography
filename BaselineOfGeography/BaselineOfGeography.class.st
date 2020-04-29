Class {
	#name : #BaselineOfGeography,
	#superclass : #BaselineOf,
	#category : #BaselineOfGeography
}

{ #category : #baselines }
BaselineOfGeography >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Geography';
			package: #'Geography-Tests' with: [
				spec requires: #('Geography' ). ].
		spec 
			group: 'Core' with: #('Geography' );
			group: 'default' with: #('Geography' 'GeoGraphy-Tests'). ].

]
