Class {
	#name : 'CustomerSatisfactionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'result'
	],
	#category : 'CodeOfSpec20Book-Chapter02',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter02'
}

{ #category : 'examples' }
CustomerSatisfactionPresenter class >> example [

	^ self new open
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> connectPresenters [ 
	"Note that the actions could also be part of the initializePresenters method."

	buttonHappy action: [ result label: buttonHappy label ].
	buttonNeutral action: [ result label: buttonNeutral label ].
	buttonBad action: [ result label: buttonBad label ]
]

{ #category : 'layout' }
CustomerSatisfactionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight 
					add: buttonHappy;
					add: buttonNeutral;
					add: buttonBad;
					yourself);
		add: result;
		yourself
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> initializePresenters [

	result := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton.
	
	"Presenter configuration"
	result label: 'Please give us your feedback.'.
	buttonHappy
		label: 'Happy';
		icon: (self iconNamed: #thumbsUp).
	buttonNeutral
		label: 'Neutral';
		icon: (self iconNamed: #user).
	buttonBad
		label: 'Bad';
		icon: (self iconNamed: #thumbsDown)
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent:  400@100
]
