Class {
	#name : #GG3DPoint,
	#superclass : #GGPoint,
	#instVars : [
		'altitude'
	],
	#category : #Geography
}

{ #category : #accessing }
GG3DPoint >> altitude [
	^ altitude
]

{ #category : #accessing }
GG3DPoint >> altitude: anObject [
	altitude := anObject
]
