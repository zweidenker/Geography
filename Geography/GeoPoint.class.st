Class {
	#name : #GeoPoint,
	#superclass : #Object,
	#instVars : [
		'latitude',
		'longitude'
	],
	#category : #Geography
}

{ #category : #converting }
GeoPoint >> asPoint [
	^ latitude @ longitude
]

{ #category : #'as yet unclassified' }
GeoPoint >> degree: degree minutes: minutes seconds: seconds direction: direction [ 
	| decimal |
	decimal := (degree + (minutes / 60) + (seconds / 3600)) asFloat.
	((direction = #north) | (direction = #south)) ifTrue: [ 
		^ self latitude: decimal ].
	((direction = #east) | (direction = #west)) ifTrue: [ 
		^ self longitude: decimal ].
	Error signal: 'direction is unknow. Needs to be #east #west #north or #south'
]

{ #category : #'as yet unclassified' }
GeoPoint >> greaterCircleDistanceTo: aGJPoint [
	| maxDistancePerDegree longitudeFactor deltaLatitude deltaLongitude |
	"Simplyfications:
		- the earth is a perfect sphere
		- the equator has a approximate circumference of 40,075 km"
	maxDistancePerDegree := 111319. " ca 40075000 m / 360° "
	longitudeFactor := ((self latitude + aGJPoint latitude) / 2 * Float pi / 180) cos.
	deltaLongitude := (self longitude - aGJPoint longitude) * maxDistancePerDegree * longitudeFactor.
	deltaLatitude := (self latitude - aGJPoint latitude) * maxDistancePerDegree.
	^ ((deltaLongitude raisedTo: 2) + (deltaLatitude raisedTo: 2)) sqrt.
]

{ #category : #accessing }
GeoPoint >> latitude [
	^ latitude
]

{ #category : #accessing }
GeoPoint >> latitude: anObject [
	latitude := anObject
]

{ #category : #accessing }
GeoPoint >> longitude [
	^ longitude
]

{ #category : #accessing }
GeoPoint >> longitude: anObject [
	longitude := anObject
]

{ #category : #'point functions' }
GeoPoint >> squaredDistanceTo: aGeoPoint [
	^ self asPoint squaredDistanceTo: aGeoPoint asPoint
]
