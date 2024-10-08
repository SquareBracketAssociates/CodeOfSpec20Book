Class {
	#name : 'SaveMailCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'converting' }
SaveMailCommand >> asSpecCommand [

	^ super asSpecCommand
		iconName: #smallSave;
		shortcutKey: $s meta;
		yourself
]

{ #category : 'testing' }
SaveMailCommand >> canBeExecuted [

	^ self mailClientPresenter hasDraft
]

{ #category : 'executing' }
SaveMailCommand >> execute [

	self mailClientPresenter saveMail
]

{ #category : 'initialization' }
SaveMailCommand >> initialize [

	super initialize.
	self
		name: 'Save';
		description: 'Save the email'
]
