"
This demonstrate how to embed a morph using **SpMorphPresenter**

```smalltalk
SpAthensHelloPresenter open
```
"
Class {
	#name : 'SpAthensHelloPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'morphPresenter'
	],
	#category : 'CodeOfSpec20Book-Chapter16',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter16'
}

{ #category : 'instance creation' }
SpAthensHelloPresenter class >> open [ 

	self new open
]

{ #category : 'instance creation' }
SpAthensHelloPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
			add: morphPresenter;
			yourself 
]

{ #category : 'instance creation' }
SpAthensHelloPresenter >> initializePresenters [

	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensHello new
]
