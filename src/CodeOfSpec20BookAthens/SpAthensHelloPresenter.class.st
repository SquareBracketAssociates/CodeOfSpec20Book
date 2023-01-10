Class {
	#name : #SpAthensHelloPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter'
	],
	#category : #CodeOfSpec20BookAthens
}

{ #category : #'instance creation' }
SpAthensHelloPresenter class >> open [ 

	self new open
]

{ #category : #'instance creation' }
SpAthensHelloPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
			add: morphPresenter;
			yourself 
]

{ #category : #'instance creation' }
SpAthensHelloPresenter >> initializePresenters [

	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensHello new
]
