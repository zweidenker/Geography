Class {
	#name : #GGPoint,
	#superclass : #Object,
	#instVars : [
		'latitude',
		'longitude'
	],
	#category : #Geography
}

{ #category : #'instance creation' }
GGPoint class >> longitude: alongitude latitude: latitude [ 
	^ self new 
		longitude: alongitude;
		latitude: latitude
]

{ #category : #comparing }
GGPoint >> = aGeoPoint [
	(self class = aGeoPoint class) ifFalse: [ 
		^ false ].
	^ aGeoPoint hasSameLongitude: longitude latitude: latitude
]

{ #category : #converting }
GGPoint >> asPoint [
	^ longitude @ latitude
]

{ #category : #converting }
GGPoint >> asTuple [
	^ { longitude . latitude }
]

{ #category : #'as yet unclassified' }
GGPoint >> degree: degree minutes: minutes seconds: seconds direction: direction [ 
	| decimal |
	decimal := (degree + (minutes / 60) + (seconds / 3600)) asFloat.
	((direction = #north) | (direction = #south)) ifTrue: [ 
		^ self latitude: decimal ].
	((direction = #east) | (direction = #west)) ifTrue: [ 
		^ self longitude: decimal ].
	Error signal: 'direction is unknow. Needs to be #east #west #north or #south'
]

{ #category : #accessing }
GGPoint >> first [
	^ longitude 
]

{ #category : #'as yet unclassified' }
GGPoint >> greaterCircleDistanceTo: aGJPoint [
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

{ #category : #comparing }
GGPoint >> hasSameLongitude: aLongitude latitude: aLatitude [
	^ (aLongitude = longitude) & (aLatitude = latitude)
]

{ #category : #comparing }
GGPoint >> hash [ 
	^ longitude hash bitXor: latitude hash
]

{ #category : #accessing }
GGPoint >> latitude [
	^ latitude
]

{ #category : #accessing }
GGPoint >> latitude: anObject [
	latitude := anObject
]

{ #category : #accessing }
GGPoint >> longitude [
	^ longitude
]

{ #category : #accessing }
GGPoint >> longitude: anObject [
	longitude := anObject
]

{ #category : #printing }
GGPoint >> printOn: aStream [ 
	aStream << latitude asString << ',' << longitude asString
]

{ #category : #accessing }
GGPoint >> second [
	^ latitude
]

{ #category : #'point functions' }
GGPoint >> squaredDistanceTo: aGeoPoint [
	^ self asPoint squaredDistanceTo: aGeoPoint asPoint
]
