Class {
	#name : 'MailClientPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'account',
		'reader',
		'menuBar',
		'toolBar',
		'saveButton',
		'sendButton',
		'statusBar',
		'editedEmail'
	],
	#category : 'CodeOfSpec20Book-Chapter12-Presenters',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12-Presenters'
}

{ #category : 'private' }
MailClientPresenter >> accountMenu [

	^ self newMenu
		addItem: [ :item |
			item
				name: 'Delete';
				enabled: [ account hasSelectedEmail ];
				action: [ self deleteMail ] ];
		addItem: [ :item |
			item
				name: 'Send';
				enabled: [ account hasSelectedEmail and: [ account selectedItem isDraft] ];
				action: [ self sendMail ] ];
		yourself
]

{ #category : 'initialization' }
MailClientPresenter >> connectPresenters [

	account whenSelectionChangedDo: [
		| selectedEmail |
		editedEmail := nil.
		account hasSelectedEmail
			ifTrue: [
				selectedEmail := account selectedItem.
				selectedEmail isDraft
					ifTrue: [ editedEmail := selectedEmail].
				reader updateLayoutForEmail: selectedEmail ]
			ifFalse: [ reader updateLayoutForNoEmail ].
		self updateToolBarButtons.
		statusBar popMessage ]
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

{ #category : 'actions' }
MailClientPresenter >> deleteMail [

	account deleteMail.
	self modelChanged.
	statusBar pushMessage: 'Mail deleted.'
]

{ #category : 'actions' }
MailClientPresenter >> fetchMail [

	account fetchMail.
	self modelChanged.
	statusBar pushMessage: 'Mail fetched.'
]

{ #category : 'private' }
MailClientPresenter >> formatMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Plain text' ];
		addItem: [ :item | item name: 'Rich text' ];
		yourself
]

{ #category : 'testing' }
MailClientPresenter >> hasDraft [

	^ editedEmail isNotNil
]

{ #category : 'initialization' }
MailClientPresenter >> initializeMenuBar [

	menuBar := self newMenuBar
		addItem: [ :item |
			item
				name: 'Message';
				subMenu: self messageMenu;
				yourself ];
		addItem: [ :item |
			item
				name: 'View';
				subMenu: self viewMenu;
				yourself ];
		addItem: [ :item |
			item
				name: 'Format';
				subMenu: self formatMenu;
				yourself ];
		yourself.
	"menuBar halt addKeybindingsTo: self"
	
]

{ #category : 'initialization' }
MailClientPresenter >> initializePresenters [

	account := MailAccountPresenter on: self model.
	account contextMenu: [ self accountMenu ].
	reader := MailReaderPresenter new.
	self initializeMenuBar.
	self initializeToolBar.
	statusBar := self newStatusBar
]

{ #category : 'initialization' }
MailClientPresenter >> initializeToolBar [

	| newButton fetchButton |
	newButton := self newToolbarButton
		label: 'New';
		icon: (self iconNamed: #smallNew);
		help: 'New email';
		action: [ self newMail ];
		yourself.
	saveButton := self newToolbarButton
		label: 'Save';
		icon: (self iconNamed: #smallSave);
		help: 'Save email';
		action: [ self saveMail ];
		yourself.
	sendButton := self newToolbarButton
		label: 'Send';
		icon: (self iconNamed: #smallExport);
		help: 'Send email';
		action: [ self sendMail ];
		yourself.
	fetchButton := self newToolbarButton
		label: 'Fetch';
		icon: (self iconNamed: #refresh);
		help: 'Fetch emails from server';
		action: [ self fetchMail ];
		yourself.
	toolBar := self newToolbar
		addItem: newButton;
		addItem: saveButton;
		addItem: sendButton;
		addItemRight: fetchButton;
	yourself
]

{ #category : 'initialization' }
MailClientPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Mail';
		initialExtent: 650@500;
		menu: menuBar;
		toolbar: toolBar;
		statusBar: statusBar;
		whenOpenedDo: [ menuBar addKeybindingsTo: aWindowPresenter ]
]

{ #category : 'private' }
MailClientPresenter >> messageMenu [

	^ self newMenu
		addGroup: [ :group |
			group
				addItem: [ :item |
					item
						name: 'New';
						shortcut: $n meta;
						action: [ self newMail ] ];
				addItem: [ :item |
					item
						name: 'Save';
						shortcut: $s meta;
						enabled: [ self hasDraft ];
						action: [ self saveMail ] ];
				addItem: [ :item |
					item
						name: 'Delete';
						shortcut: $d meta;
						enabled: [ account hasSelectedEmail ];
						action: [ self deleteMail ] ];
				addItem: [ :item |
					item
						name: 'Send';
						shortcut: $l meta;
						enabled: [ self hasDraft ];
						action: [ self sendMail ] ] ];
		addGroup: [ :group |
			group
				addItem: [ :item |
					item
						name: 'Fetch';
						shortcut: $f meta;
						action: [ self fetchMail ] ];
				yourself ]
]

{ #category : 'initialization' }
MailClientPresenter >> modelChanged [

	self updateToolBarButtons
]

{ #category : 'actions' }
MailClientPresenter >> newMail [

	editedEmail := Email new.
	editedEmail beDraft.
	reader updateLayoutForEmail: editedEmail.
	self modelChanged
]

{ #category : 'actions' }
MailClientPresenter >> saveMail [

	account saveAsDraft: editedEmail.
	editedEmail := nil.
	self modelChanged.
	statusBar pushMessage: 'Mail saved to drafts.'
]

{ #category : 'actions' }
MailClientPresenter >> sendMail [

	account sendMail: editedEmail.
	editedEmail := nil.
	self modelChanged.
	statusBar pushMessage: 'Mail sent.'
]

{ #category : 'private' }
MailClientPresenter >> updateToolBarButtons [

	| hasSelectedDraft |
	hasSelectedDraft := self hasDraft.
	saveButton enabled: hasSelectedDraft.
	sendButton enabled: hasSelectedDraft
]

{ #category : 'private' }
MailClientPresenter >> viewMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Show CC field' ];
		addItem: [ :item | item name: 'Show BCC field' ];
		yourself
]
