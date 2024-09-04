"
I display `Folder`s and `Email`s based on email status.
"
Class {
	#name : 'MailAccountPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'foldersAndEmails'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'initialization' }
MailAccountPresenter >> contextMenu: aBlock [

	foldersAndEmails contextMenu: aBlock
]

{ #category : 'layout' }
MailAccountPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: foldersAndEmails;
		yourself.
]

{ #category : 'ports' }
MailAccountPresenter >> defaultOutputPort [

	^ foldersAndEmails defaultOutputPort
]

{ #category : 'actions' }
MailAccountPresenter >> deleteMail [

	| pathIndexes folder email |
	pathIndexes := foldersAndEmails selection selectedPath.
	folder := foldersAndEmails itemAtPath: (pathIndexes copyFrom: 1 to: 1).
	email := foldersAndEmails itemAtPath: pathIndexes.
	self model delete: email.
	self modelChanged
]

{ #category : 'actions' }
MailAccountPresenter >> fetchMail [

	self model fetchMail.
	self modelChanged
]

{ #category : 'testing' }
MailAccountPresenter >> hasSelectedEmail [

	^ foldersAndEmails selection selectedPath size = 2
]

{ #category : 'initialization' }
MailAccountPresenter >> initializePresenters [

	foldersAndEmails := self newTree
		roots: Array new;
		display: [ :node | node displayName ];
		children: [ :node | node content ];
		expandRoots
]

{ #category : 'initialization' }
MailAccountPresenter >> modelChanged [

	| inbox draft sent |
	inbox := MailFolder named: 'Inbox' emails: self model receivedEmails.
	draft := MailFolder named: 'Draft' emails: self model draftEmails.
	sent := MailFolder named: 'Sent' emails: self model sentEmails.
	foldersAndEmails
		roots: { inbox . draft . sent };
		expandRoots
]

{ #category : 'actions' }
MailAccountPresenter >> saveAsDraft: draftEmail [

	self model saveAsDraft: draftEmail.
	self modelChanged
]

{ #category : 'testing' }
MailAccountPresenter >> selectedItem [

	^ foldersAndEmails selectedItem
]

{ #category : 'actions' }
MailAccountPresenter >> sendMail: draftEmail [

	self model send: draftEmail.
	self modelChanged
]

{ #category : 'initialization' }
MailAccountPresenter >> whenSelectionChangedDo: aBlock [

	foldersAndEmails whenSelectionChangedDo: aBlock
]
