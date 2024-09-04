"
I display different layouts depending on whether I have a draft email, another email, or no email.
"
Class {
	#name : 'MailReaderPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'content',
		'noContent'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'layout' }
MailReaderPresenter >> defaultLayout [

	^ self noEmailLayout
]

{ #category : 'layout' }
MailReaderPresenter >> emailLayout [

	^ SpBoxLayout newLeftToRight
		add: content;
		yourself
]

{ #category : 'initialization' }
MailReaderPresenter >> initializePresenters [

	content := EmailPresenter new.
	noContent := NoEmailPresenter new
]

{ #category : 'layout' }
MailReaderPresenter >> noEmailLayout [

	^ SpBoxLayout newLeftToRight
		add: noContent;
		yourself
]

{ #category : 'updating' }
MailReaderPresenter >> read: folderOrEmail [

	(folderOrEmail isNotNil and: [ folderOrEmail isEmail ])
		ifTrue: [ self updateLayoutForEmail: folderOrEmail ]
		ifFalse: [ self updateLayoutForNoEmail ]
]

{ #category : 'updating' }
MailReaderPresenter >> updateLayoutForEmail: email [

	content model: email.
	self layout: self emailLayout.
	email isDraft ifTrue: [ content beEditable ] ifFalse: [ content beReadOnly ]
]

{ #category : 'updating' }
MailReaderPresenter >> updateLayoutForNoEmail [

	self layout: self noEmailLayout
]
