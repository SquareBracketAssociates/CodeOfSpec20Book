Class {
	#name : #CustomerSatisfactionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'screen'
	],
	#category : #CodeOfSpec20Book
}

{ #category : #specs }
CustomerSatisfactionPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical 
		add: (SpBoxLayout newHorizontal
					add: #buttonHappy; add: #buttonNeutral; add: #buttonBad);
		"origin: 0 @ 0 corner: 1 @ 0.7;"
		add:  #screen;
		"origin: 0 @ 0.7 corner: 1 @ 1;"
		yourself
]

{ #category : #initialization }
CustomerSatisfactionPresenter >> initializePresenter [

	buttonHappy action: [ screen label: buttonHappy label ].
	buttonNeutral action: [ screen label: buttonNeutral label ].
	buttonBad action: [ screen label: buttonBad label ].
]

{ #category : #initialization }
CustomerSatisfactionPresenter >> initializeWidgets [

	"Presenter creation"
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
		
	self focusOrder
		add: buttonHappy;
		add: buttonNeutral;
		add: buttonBad
]
