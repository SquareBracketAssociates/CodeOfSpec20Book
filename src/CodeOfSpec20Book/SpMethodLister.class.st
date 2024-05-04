"
I'm the core of the way how to build a presenter whose sub presenters are initialized based on a model (external object passed as argument). 

In contrast with `SpMethodListerWithModel` I do not handle change of model (my sub presenters are not automatically updated). 

```
(SpMethodLister on: Point) open
```
"
Class {
	#name : 'SpMethodLister',
	#superclass : 'SpPresenter',
	#instVars : [
		'aClass',
		'list'
	],
	#category : 'CodeOfSpec20Book-Chapter07',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter07'
}

{ #category : 'layout' }
SpMethodLister class >> defaultLayout [ 
	^ SpBoxLayout newTopToBottom add: #list ; yourself
]

{ #category : 'initialization' }
SpMethodLister >> class: aModel [

	aClass := aModel
	
]

{ #category : 'initialization' }
SpMethodLister >> initializePresenters [ 
	list := self newList.
	list items: aClass selectors sorted
]

{ #category : 'accessing - model' }
SpMethodLister >> setModelBeforeInitialization: aModel [

	aClass := aModel
	
]
