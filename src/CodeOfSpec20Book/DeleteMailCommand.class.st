Class {
	#name : 'DeleteMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'converting' }
DeleteMailCommand >> asSpecCommand [

	^ super asSpecCommand
		shortcutKey: $d meta;
		yourself
]

{ #category : 'testing' }
DeleteMailCommand >> canBeExecuted [

	^ self mailClientPresenter hasSelectedEmail
]

{ #category : 'testing' }
DeleteMailCommand >> execute [

	^ self mailClientPresenter deleteMail
]

{ #category : 'initialization' }
DeleteMailCommand >> initialize [

	super initialize.
	self
		name: 'Delete';
		description: 'Delete the selected email'
]
