Class {
	#name : 'ShowCcFieldCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'initialization' }
ShowCcFieldCommand >> initialize [

	super initialize.
	self
		name: 'Show CC field';
		description: 'Turn on the CC field'
]
