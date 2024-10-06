Class {
	#name : 'FormatPlainTextCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter19',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter19'
}

{ #category : 'initialization' }
FormatPlainTextCommand >> initialize [

	super initialize.
	self
		name: 'Plain text';
		description: 'Use plain text'
]
