"
I show a simple UI with plus and minus buttons without actions.
"
Class {
	#name : 'WindowExamplePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'minusButton',
		'plusButton'
	],
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'specs' }
WindowExamplePresenter class >> exampleOpen [

	self new open

]

{ #category : 'specs' }
WindowExamplePresenter class >> exampleOpenAsDialog [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
]

{ #category : 'specs' }
WindowExamplePresenter class >> exampleOpenAsDialogWithButtonActions [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
		okAction: [ 'okAction' crTrace ];
		cancelAction: [ 'cancelAction' crTrace ]
]

{ #category : 'layout' }
WindowExamplePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'
]
