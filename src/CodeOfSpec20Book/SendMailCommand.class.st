Class {
	#name : 'SendMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'converting' }
SendMailCommand >> asSpecCommand [

	^ super asSpecCommand
		iconName: #smallExport;
		shortcutKey: $l meta;
		yourself
]

{ #category : 'testing' }
SendMailCommand >> canBeExecuted [

	^ self mailClientPresenter hasDraft
]

{ #category : 'executing' }
SendMailCommand >> execute [

	self mailClientPresenter sendMail
]

{ #category : 'initialization' }
SendMailCommand >> initialize [

	super initialize.
	self
		name: 'Send';
		description: 'Send the selected email'
]
