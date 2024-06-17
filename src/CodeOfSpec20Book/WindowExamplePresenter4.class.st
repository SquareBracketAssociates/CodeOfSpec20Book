"
I set the initial extent of the window. Clicking the buttons resizes the window.
"
Class {
	#name : 'WindowExamplePresenter4',
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
WindowExamplePresenter4 class >> exampleOpen [

	self new open
]

{ #category : 'examples' }
WindowExamplePresenter4 class >> exampleOpenFixedSize [

	| presenter |
	presenter := WindowExamplePresenter new open.
	presenter window beUnresizeable
]

{ #category : 'examples' }
WindowExamplePresenter4 class >> exampleSettingAndChangingExtent [

	| windowPresenter |
	 windowPresenter := self new asWindow.
	 windowPresenter initialExtent: 300@80.
	 windowPresenter open
]

{ #category : 'layout' }
WindowExamplePresenter4 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter4 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'.
	plusButton action: [ self window resize: 500@200].
	minusButton action: [ self window resize: 200@100]
]

{ #category : 'initialization' }
WindowExamplePresenter4 >> initializeWindow: aWindowPresenter [

	aWindowPresenter initialExtent: 80@100
]
