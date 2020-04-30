Extension { #name : #Number }

{ #category : #'*Geography' }
Number >> @@ aNumber [
	^ GGPoint longitude: self latitude: aNumber
]
