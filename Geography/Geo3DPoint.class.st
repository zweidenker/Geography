Class {
	#name : #Geo3DPoint,
	#superclass : #GeoPoint,
	#instVars : [
		'altitude'
	],
	#category : #Geography
}

{ #category : #accessing }
Geo3DPoint >> altitude [
	^ altitude
]

{ #category : #accessing }
Geo3DPoint >> altitude: anObject [
	altitude := anObject
]
