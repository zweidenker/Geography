Class {
	#name : #GeographyTests,
	#superclass : #TestCase,
	#category : #'Geography-Tests'
}

{ #category : #tests }
GeographyTests >> testNumberConversion [
	self assert: 51@@13 equals: (GeoPoint longitude: 51 latitude: 13)
]
