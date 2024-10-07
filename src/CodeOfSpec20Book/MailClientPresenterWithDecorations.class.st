"
I specialize my superclass with a menubar, toolbar, context menu, and status bar.
"
Class {
	#name : 'MailClientPresenterWithDecorations',
	#superclass : 'MailClientPresenter',
	#instVars : [
		'saveButton',
		'sendButton',
		'menuBar',
		'statusBar',
		'toolBar'
	],
	#category : 'CodeOfSpec20Book-Chapter13',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter13'
}

{ #category : 'examples' }
MailClientPresenterWithDecorations class >> example [

	(self on: MailAccount new) open
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> accountMenu [

	^ self newMenu
		addItem: [ :item |
			item
				name: 'Delete';
				enabled: [ self hasSelectedEmail ];
				action: [ self deleteMail ] ];
		addItem: [ :item |
			item
				name: 'Send';
				enabled: [ self hasSelectedEmail and: [ account selectedItem isDraft] ];
				action: [ self sendMail ] ];
		yourself
]

{ #category : 'actions' }
MailClientPresenterWithDecorations >> deleteMail [

	account deleteMail.
	self modelChanged.
	statusBar pushMessage: 'Mail deleted.'
]

{ #category : 'actions' }
MailClientPresenterWithDecorations >> fetchMail [

	account fetchMail.
	self modelChanged.
	statusBar pushMessage: 'Mail fetched.'
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> formatMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Plain text' ];
		addItem: [ :item | item name: 'Rich text' ];
		yourself
]

{ #category : 'testing' }
MailClientPresenterWithDecorations >> hasDraft [

	^ editedEmail isNotNil
]

{ #category : 'testing' }
MailClientPresenterWithDecorations >> hasSelectedEmail [

	^ account hasSelectedEmail
]

{ #category : 'initialization' }
MailClientPresenterWithDecorations >> initializeMenuBar [

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
		yourself
	
]

{ #category : 'initialization' }
MailClientPresenterWithDecorations >> initializePresenters [

	super initializePresenters.
	account contextMenu: [ self accountMenu ].
	self initializeMenuBar.
	self initializeToolBar.
	statusBar := SpStatusBarPresenter new
]

{ #category : 'initialization' }
MailClientPresenterWithDecorations >> initializeToolBar [

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
MailClientPresenterWithDecorations >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: menuBar;
		toolbar: toolBar;
		statusBar: statusBar.
	menuBar addKeybindingsTo: aWindowPresenter
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> messageMenu [

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
MailClientPresenterWithDecorations >> modelChanged [

	self updateToolBarButtons
]

{ #category : 'actions' }
MailClientPresenterWithDecorations >> newMail [

	editedEmail := Email new.
	editedEmail beDraft.
	reader updateLayoutForEmail: editedEmail.
	self modelChanged
]

{ #category : 'actions' }
MailClientPresenterWithDecorations >> saveMail [

	account saveAsDraft: editedEmail.
	editedEmail := nil.
	self modelChanged.
	statusBar pushMessage: 'Mail saved to drafts.'
]

{ #category : 'actions' }
MailClientPresenterWithDecorations >> sendMail [

	account sendMail: editedEmail.
	editedEmail := nil.
	self modelChanged.
	statusBar pushMessage: 'Mail sent.'
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> updateAfterSelectionChangedTo: selectedFolderOrEmail [

	super updateAfterSelectionChangedTo: selectedFolderOrEmail.
	self updateToolBarButtons.
	statusBar popMessage
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> updateToolBarButtons [

	| hasSelectedDraft |
	hasSelectedDraft := self hasDraft.
	saveButton enabled: hasSelectedDraft.
	sendButton enabled: hasSelectedDraft
]

{ #category : 'private' }
MailClientPresenterWithDecorations >> viewMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Show CC field' ];
		addItem: [ :item | item name: 'Show BCC field' ];
		yourself
]
