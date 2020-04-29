Extension { #name : #Number }

{ #category : #'*Geography' }
Number >> @@ aNumber [
	^ GeoPoint longitude: self latitude: aNumber
]
