Class {
	#name : 'ShowBccFieldCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter19',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter19'
}

{ #category : 'initialization' }
ShowBccFieldCommand >> initialize [

	super initialize.
	self
		name: 'Show BCC field';
		description: 'Turn on the BCC field'
]
