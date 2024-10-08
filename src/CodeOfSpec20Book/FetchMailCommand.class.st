Class {
	#name : 'FetchMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'converting' }
FetchMailCommand >> asSpecCommand [

	^ super asSpecCommand
		iconName: #refresh;
		shortcutKey: $f meta;
		beDisplayedOnRightSide;
		yourself
]

{ #category : 'executing' }
FetchMailCommand >> execute [

	self mailClientPresenter fetchMail
]

{ #category : 'initialization' }
FetchMailCommand >> initialize [

	super initialize.
	self
		name: 'Fetch';
		description: 'Fetch email from the server'
]
