Class {
	#name : #GG3DPoint,
	#superclass : #GGPoint,
	#instVars : [
		'altitude'
	],
	#category : #'Geography-Core-Geography-Core'
}

{ #category : #accessing }
GG3DPoint >> altitude [
	^ altitude
]

{ #category : #accessing }
GG3DPoint >> altitude: anObject [
	altitude := anObject
]
