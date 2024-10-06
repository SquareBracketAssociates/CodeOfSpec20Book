Class {
	#name : 'ShowCcFieldCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter19',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter19'
}

{ #category : 'initialization' }
ShowCcFieldCommand >> initialize [

	super initialize.
	self
		name: 'Show CC field';
		description: 'Turn on the CC field'
]
