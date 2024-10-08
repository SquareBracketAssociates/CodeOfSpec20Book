Class {
	#name : 'FormatRichTextCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'initialization' }
FormatRichTextCommand >> initialize [

	super initialize.
	self
		name: 'Rich text';
		description: 'Use rich text'
]
