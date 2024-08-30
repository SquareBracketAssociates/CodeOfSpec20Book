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
	editedEmail := nil.
	account hasSelectedEmail
		ifTrue: [
			selectedEmail := account selectedItem.
			selectedEmail isDraft
				ifTrue: [ editedEmail := selectedEmail].
			reader updateLayoutForEmail: selectedEmail ]
		ifFalse: [ reader updateLayoutForNoEmail ]
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
