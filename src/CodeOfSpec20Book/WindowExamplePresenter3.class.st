"
I inform the user when a window closes.
"
Class {
	#name : 'WindowExamplePresenter3',
	#superclass : 'SpPresenter',
	#instVars : [
		'minusButton',
		'plusButton'
	],
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'examples' }
WindowExamplePresenter3 class >> exampleDialogWhenClosed [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog.
	dialog
		okAction: [ 'okAction' crTrace ];
		cancelAction: [ 'cancelAction' crTrace ];
		whenClosedDo: [ self inform: 'Bye bye!' ]
]

{ #category : 'examples' }
WindowExamplePresenter3 class >> exampleWhenClosed [

	| presenter window |
	presenter := self new.
	window := presenter open.
	window close
]

{ #category : 'layout' }
WindowExamplePresenter3 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter3 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'
]

{ #category : 'initialization' }
WindowExamplePresenter3 >> initializeWindow: aWindowPresenter [

	aWindowPresenter whenClosedDo: [ self inform: 'When closed' ]
]
