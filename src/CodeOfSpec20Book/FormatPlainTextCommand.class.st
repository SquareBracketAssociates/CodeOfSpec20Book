Class {
	#name : 'FormatPlainTextCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'initialization' }
FormatPlainTextCommand >> initialize [

	super initialize.
	self
		name: 'Plain text';
		description: 'Use plain text'
]
