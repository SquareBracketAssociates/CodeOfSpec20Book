Class {
	#name : 'DeleteMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter19',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter19'
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
