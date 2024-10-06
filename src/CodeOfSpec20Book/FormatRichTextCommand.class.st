Class {
	#name : 'FormatRichTextCommand',
	#superclass : 'MailClientCommand',
	#category : 'CodeOfSpec20Book-Chapter19',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter19'
}

{ #category : 'initialization' }
FormatRichTextCommand >> initialize [

	super initialize.
	self
		name: 'Rich text';
		description: 'Use rich text'
]
