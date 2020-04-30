Extension { #name : #Number }

{ #category : #'*Geography-Core' }
Number >> @@ aNumber [
	^ GGPoint longitude: self latitude: aNumber
]
