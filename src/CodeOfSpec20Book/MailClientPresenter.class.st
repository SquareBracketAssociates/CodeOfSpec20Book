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
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'examples' }
MailClientPresenter class >> example [

	(self on: MailAccount new) open
]

{ #category : 'initialization' }
MailClientPresenter >> connectPresenters [

	account whenSelectionChangedDo: [ :selection |
		| selectedFolderOrEmail |
		selectedFolderOrEmail := selection selectedItem.
		reader read: selectedFolderOrEmail.
		self updateAfterSelectionChangedTo: selectedFolderOrEmail ]
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

{ #category : 'private' }
MailClientPresenter >> isDraftEmail: folderOrEmailOrNil [

	^ folderOrEmailOrNil isNotNil and: [ folderOrEmailOrNil isEmail and: [ folderOrEmailOrNil isDraft ] ]
]

{ #category : 'private' }
MailClientPresenter >> updateAfterSelectionChangedTo: selectedFolderOrEmail [

	editedEmail := (self isDraftEmail: selectedFolderOrEmail)
		ifTrue: [ selectedFolderOrEmail ]
		ifFalse: [ nil ]
]
