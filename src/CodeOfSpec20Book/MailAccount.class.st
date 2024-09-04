"
I represent a mail account that manages `Email`s.
"
Class {
	#name : 'MailAccount',
	#superclass : 'Model',
	#instVars : [
		'emails'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'actions' }
MailAccount >> delete: anEmail [

	emails remove: anEmail.
	self changed
]

{ #category : 'accessing' }
MailAccount >> draftEmails [

	^ emails select: [ :each | each isDraft ]
]

{ #category : 'actions' }
MailAccount >> fetchMail [

	| email |
	email := Email new
		from: 'book@pharo.org';
		to: 'readers@pharo.org';
		subject: 'The Spec 2.0 book has been released';
		body: 'Dear reader,
The Spec 2.0 book is available.
Best regards.';
		beReceived;
		yourself.
	(emails includes: email) ifFalse: [ emails add: email ].
	self changed
]

{ #category : 'intialization' }
MailAccount >> initialize [

	super initialize.
	emails := OrderedCollection new
]

{ #category : 'accessing' }
MailAccount >> receivedEmails [

	^ emails select: [ :each | each isReceived ]
]

{ #category : 'actions' }
MailAccount >> saveAsDraft: anEmail [

	anEmail beDraft.
	(emails includes: anEmail) ifFalse: [ emails add: anEmail ].
	self changed
]

{ #category : 'actions' }
MailAccount >> send: anEmail [

	anEmail beSent.
	(emails includes: anEmail) ifFalse: [ emails add: anEmail ].
	self changed
]

{ #category : 'accessing' }
MailAccount >> sentEmails [

	^ emails select: [ :each | each isSent ]
]
