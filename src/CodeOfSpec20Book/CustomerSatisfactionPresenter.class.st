Class {
	#name : 'CustomerSatisfactionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'screen'
	],
	#category : 'CodeOfSpec20Book-Chapter02',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter02'
}

{ #category : 'examples' }
CustomerSatisfactionPresenter class >> defaultLayout [
	^ SpBoxLayout newTopToBottom  
		add: (SpBoxLayout newLeftToRight 
					add: #buttonHappy; add: #buttonNeutral; add: #buttonBad; yourself);
		add:  #screen;
		yourself
]

{ #category : 'examples' }
CustomerSatisfactionPresenter class >> example [
	<example>
	
	^ self new open
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> connectPresenters [ 
	"note that the actions could also be part of the initializePresenters method"
	
	buttonHappy action: [ screen label: buttonHappy label ].
	buttonNeutral action: [ screen label: buttonNeutral label ].
	buttonBad action: [ screen label: buttonBad label ].
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom  
		add: (SpBoxLayout newLeftToRight 
					add: #buttonHappy; add: #buttonNeutral; add: #buttonBad; yourself);
		add:  #screen;
		yourself
]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> initializePresenters [

	screen := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton.
	
	"Presenter configuration"
	screen label: 'Please give us your feedback.'.
	buttonHappy
		label: 'Happy';
		icon: (self iconNamed: #thumbsUp).
	buttonNeutral
		label: 'Neutral';
		icon: (self iconNamed: #user).
	buttonBad
		label: 'Bad';
		icon: (self iconNamed: #thumbsDown).
		

]

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent:  400@100
]
