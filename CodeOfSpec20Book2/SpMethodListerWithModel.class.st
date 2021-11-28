"
```
(SpMethodListerWithModel on: Point) openWithSpec
```

```
	| lister | 
	lister := SpMethodListerWithModel on: Point.
	lister openWithSpec.
	lister model: Rectangle
```
"
Class {
	#name : #SpMethodListerWithModel,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'list'
	],
	#category : #CodeOfSpec20Book2
}

{ #category : #specs }
SpMethodListerWithModel class >> defaultSpec [ 
	^ SpBoxLayout newTopToBottom add: #list ; yourself
]

{ #category : #initialization }
SpMethodListerWithModel >> initializePresenters [ 
	list := self newList.
	
]

{ #category : #initialization }
SpMethodListerWithModel >> modelChanged [

	list items: self model selectors sorted
]
