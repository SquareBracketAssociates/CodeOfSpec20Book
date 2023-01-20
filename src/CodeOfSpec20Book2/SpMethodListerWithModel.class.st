"
I'm the core of the logic to have a presenter using a model and that reacts to model changes.


Here is how to get the example.
```
(SpMethodListerWithModel on: Point) open
```

The following code snippet shows that the sub presenters get updated after model changes.

```
	| lister | 
	lister := SpMethodListerWithModel on: Point.
	lister open.
	lister model: Rectangle
```
"
Class {
	#name : #SpMethodListerWithModel,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'list'
	],
	#category : #'CodeOfSpec20Book2-WithModel'
}

{ #category : #layout }
SpMethodListerWithModel class >> defaultLayout [ 
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
