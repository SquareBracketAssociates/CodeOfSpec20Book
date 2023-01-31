Class {
	#name : #BookScripts,
	#superclass : #Object,
	#category : #'CodeOfSpec20Book-Scripts'
}

{ #category : #scripts }
BookScripts class >> allInstances [
	| registeredColorsList |
	registeredColorsList := SpListPresenter new.
	registeredColorsList
		items: (Color allInstances sort: #hue ascending).
	registeredColorsList open
		title: 'Registered colors'.
	^ registeredColorsList
]

{ #category : #scripts }
BookScripts class >> colorNames [
	| registeredColorsList |
	registeredColorsList := SpListPresenter new.
	registeredColorsList
		items: (Color registeredColorNames sort: #yourself ascending).
	registeredColorsList open
		title: 'Registered color names'.
	^ registeredColorsList
]

{ #category : #scripts }
BookScripts class >> triplet [
	| registeredColorsList |
	registeredColorsList := SpListPresenter new.
	registeredColorsList
		items: (Color allInstances sort: #hue ascending);
		display: [ :it | it rgbTriplet  ].
	registeredColorsList open
		title: 'Registered colors as triplets'.
	^ registeredColorsList
]
