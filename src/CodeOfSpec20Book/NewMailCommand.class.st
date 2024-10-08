Class {
	#name : 'NewMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'converting' }
NewMailCommand >> asSpecCommand [

	^ super asSpecCommand
		iconName: #smallNew;
		shortcutKey: $n meta;
		yourself
]

{ #category : 'executing' }
NewMailCommand >> execute [

	self mailClientPresenter newMail
]

{ #category : 'initialization' }
NewMailCommand >> initialize [

	super initialize.
	self
		name: 'New';
		description: 'Create a new email'
]
