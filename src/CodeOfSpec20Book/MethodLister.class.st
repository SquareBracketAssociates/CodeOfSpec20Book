"
I'm the core of the way how to build a presenter whose subpresenters are initialized based on a model (external object passed as argument). 

In contrast with `MethodListerWithModel` I do not handle a change of model (my subpresenters are not automatically updated). 

```
(MethodLister on: Point) open
```
"
Class {
	#name : 'MethodLister',
	#superclass : 'SpPresenter',
	#instVars : [
		'sourceClass',
		'list'
	],
	#category : 'CodeOfSpec20Book-Chapter06',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter06'
}

{ #category : 'layout' }
MethodLister >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #list;
		yourself
]

{ #category : 'initialization' }
MethodLister >> initializePresenters [

	list := self newList.
	list items: sourceClass selectors sorted
]

{ #category : 'accessing - model' }
MethodLister >> setModelBeforeInitialization: aModel [

	sourceClass := aModel
]
