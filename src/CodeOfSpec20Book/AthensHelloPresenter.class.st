"
I demonstrate how to embed a morph using **SpMorphPresenter**

```
AthensHelloPresenter new open
```
"
Class {
	#name : 'AthensHelloPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'morphPresenter'
	],
	#category : 'CodeOfSpec20Book-Chapter16',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter16'
}

{ #category : 'instance creation' }
AthensHelloPresenter class >> open [ 

	self new open
]

{ #category : 'instance creation' }
AthensHelloPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: morphPresenter;
		yourself
]

{ #category : 'instance creation' }
AthensHelloPresenter >> initializePresenters [

	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensHello new
]
