"
I'm the core of the logic to have a presenter using a model and that reacts to model changes.


Here is how to open the example.
```
(MethodListerWithModel on: Point) open
```

The following code snippet shows that the subpresenters are updated after model changes.

```
	| lister | 
	lister := MethodListerWithModel on: Point.
	lister open.
	lister model: Rectangle
```
"
Class {
	#name : 'MethodListerWithModel',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'list'
	],
	#category : 'CodeOfSpec20Book-Chapter06',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter06'
}

{ #category : 'layout' }
MethodListerWithModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #list;
		yourself
]

{ #category : 'initialization' }
MethodListerWithModel >> initializePresenters [

	list := self newList
]

{ #category : 'initialization' }
MethodListerWithModel >> modelChanged [

	list items: self model selectors sorted
]
