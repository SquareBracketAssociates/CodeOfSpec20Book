"
I am the main presenter of the Mail Application.
In a paned layout, I display a `MailAccountPresenter` on the left and a `MailReaderPresenter` on the right.
"
Class {
	#name : 'MailClientPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'account',
		'reader',
		'editedEmail'
	],
	#category : 'CodeOfSpec20Book-Chapter12-Presenters',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12-Presenters'
}

{ #category : 'initialization' }
MailClientPresenter >> connectPresenters [

	account whenSelectionChangedDo: [ self folderOrEmailSelectionChanged ]
]

{ #category : 'layout' }
MailClientPresenter >> defaultLayout [

	| content |
	content := SpPanedLayout newLeftToRight
		positionOfSlider: 40 percent;
		add: account;
		add: reader;
		yourself.
	^ SpBoxLayout newTopToBottom
		add: content expand: true fill: true padding: 5;
		yourself
]

{ #category : 'private' }
MailClientPresenter >> folderOrEmailSelectionChanged [

	| selectedEmail |
	selectedEmail := account hasSelectedEmail
		ifTrue: [ account selectedItem ]
		ifFalse: [ nil ].
	reader read: selectedEmail.
	editedEmail := (selectedEmail isNotNil and: [ selectedEmail isDraft ])
		ifTrue: [ selectedEmail ]
		ifFalse: [ nil ]
]

{ #category : 'initialization' }
MailClientPresenter >> initializePresenters [

	account := MailAccountPresenter on: self model.
	reader := MailReaderPresenter new
]

{ #category : 'initialization' }
MailClientPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Mail';
		initialExtent: 650@500
]
