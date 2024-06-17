"
I combine a horizontal two-button presenter with a list presenter in a horizontal layout.
"
Class {
	#name : 'ButtonAndListH',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttons',
		'list'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
ButtonAndListH >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: buttons;
		add: list;
		yourself
]

{ #category : 'initialization' }
ButtonAndListH >> initializePresenters [

	buttons := self instantiate: TwoButtons4.
	list := self newList.
	list items: (1 to: 10)
]

{ #category : 'initialization' }
ButtonAndListH >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'SuperWidget'
]
