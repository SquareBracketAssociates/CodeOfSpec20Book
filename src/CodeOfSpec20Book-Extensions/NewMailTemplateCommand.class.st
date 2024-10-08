"
I am a command to create a new mail with a body that is a template.
"
Class {
	#name : 'NewMailTemplateCommand',
	#superclass : 'MailClientCommand',
	#instVars : [
		'bodyTemplate'
	],
	#category : 'CodeOfSpec20Book-Extensions-Chapter18',
	#package : 'CodeOfSpec20Book-Extensions',
	#tag : 'Chapter18'
}

{ #category : 'accessing' }
NewMailTemplateCommand >> bodyTemplate: aString [

	bodyTemplate := aString
]

{ #category : 'executing' }
NewMailTemplateCommand >> execute [

	self mailClientPresenter newFromTemplate: bodyTemplate
]

{ #category : 'initialization' }
NewMailTemplateCommand >> initialize [

	super initialize.
	self
		name: 'New template';
		description: 'Create a new email from a template'
]
