"
I set the window title.
"
Class {
	#name : 'WindowExamplePresenter5',
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
WindowExamplePresenter5 class >> exampleOpenWithoutWindowDecoration [

	| presenter |
	presenter := self new open.
	presenter window
	   removeCollapseBox;
	   removeExpandBox;
	   removeCloseBox;
	   removeMenuBox
]

{ #category : 'examples' }
WindowExamplePresenter5 class >> exampleWithAboutText [

	| windowPresenter |
	 windowPresenter := WindowExamplePresenter new asWindow.
	 windowPresenter aboutText: 'Click + to grow, - to shrink.'.
	 windowPresenter open
]

{ #category : 'examples' }
WindowExamplePresenter5 class >> exampleWithChangingTitle [

	| presenter |
	presenter := self new.
	presenter open.
	presenter window title: 'I am different!'
]

{ #category : 'examples' }
WindowExamplePresenter5 class >> exampleWithTitle [

	self new open
]

{ #category : 'layout' }
WindowExamplePresenter5 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter5 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'
]

{ #category : 'initialization' }
WindowExamplePresenter5 >> initializeWindow: aWindowPresenter [

  aWindowPresenter title: 'Click to grow or shrink.'
]
