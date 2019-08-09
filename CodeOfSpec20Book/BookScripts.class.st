Class {
	#name : #BookScripts,
	#superclass : #Object,
	#category : #CodeOfSpec20Book
}

{ #category : #scripts }
BookScripts class >> allInstances [
	| registeredColorsList |
	registeredColorsList := SpListPresenter new.
	registeredColorsList
		items: (Color allInstances sort: #hue ascending).
	(registeredColorsList openWithSpec)
		title: 'Registered colors'.
	^ registeredColorsList
]

{ #category : #scripts }
BookScripts class >> colorNames [
	| registeredColorsList |
	registeredColorsList := SpListPresenter new.
	registeredColorsList
		items: (Color registeredColorNames sort: #yourself ascending).
	(registeredColorsList openWithSpec)
		title: 'Registered color names'.
	^ registeredColorsList
]
