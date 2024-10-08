"
My superclasses uses traditional means for menubars, toolsbars and context menus. I use commands.
"
Class {
	#name : 'MailClientPresenterWithCommands',
	#superclass : 'MailClientPresenterWithDecorations',
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildAccountMenuWith: presenter [

	^ (CmCommandGroup named: 'AccountMenu') asSpecGroup
		beRoot;
		register: (DeleteMailCommand forSpec context: presenter);
		register: (SendMailCommand forSpec context: presenter);
		yourself
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildAccountMenuWith: presenter);
		register: (self buildMenuBarGroupWith: presenter);
		register: (self buildToolBarGroupWith: presenter)
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildFormatMenuWith: presenter [

	^ (CmCommandGroup named: 'Format') asSpecGroup
		register: (FormatPlainTextCommand forSpec context: presenter);
		register: (FormatRichTextCommand forSpec context: presenter);
		yourself
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildMenuBarGroupWith: presenter [

	^ (CmCommandGroup named: 'MenuBar') asSpecGroup
		beRoot;
		register: (self buildMessageMenuWith: presenter);
		register: (self buildViewMenuWith: presenter);
		register: (self buildFormatMenuWith: presenter);
		yourself
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildMessageMenuWith: presenter [

	| fetchGroup |
	fetchGroup := CmCommandGroup new asSpecGroup
		register: (FetchMailCommand forSpec context: presenter);
		beDisplayedAsGroup;
		yourself.
	^ (CmCommandGroup named: 'Message') asSpecGroup
		register: (NewMailCommand forSpec context: presenter);
		register: (SaveMailCommand forSpec context: presenter);
		register: (DeleteMailCommand forSpec context: presenter);
		register: (SendMailCommand forSpec context: presenter);
		register: fetchGroup;
		yourself
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildToolBarGroupWith: presenter [

	^ (CmCommandGroup named: 'ToolBar') asSpecGroup
		beRoot;
		register: (NewMailCommand forSpec context: presenter);
		register: (SaveMailCommand forSpec context: presenter);
		register: (SendMailCommand forSpec context: presenter);
		register: (FetchMailCommand forSpec context: presenter);
		yourself
]

{ #category : 'commands' }
MailClientPresenterWithCommands class >> buildViewMenuWith: presenter [

	^ (CmCommandGroup named: 'View') asSpecGroup
		register: (ShowCcFieldCommand forSpec context: presenter);
		register: (ShowBccFieldCommand forSpec context: presenter);
		yourself
]

{ #category : 'private' }
MailClientPresenterWithCommands >> accountMenu [

	^ self newMenu
		fillWith: (self rootCommandsGroup / 'AccountMenu');
		yourself
]

{ #category : 'initialization' }
MailClientPresenterWithCommands >> initializeMenuBar [

	menuBar := self newMenuBar.
	menuBar fillWith: self rootCommandsGroup / 'MenuBar'
]

{ #category : 'initialization' }
MailClientPresenterWithCommands >> initializeToolBar [

	toolBar := self newToolbar.
	self updateToolBarButtons
]

{ #category : 'private' }
MailClientPresenterWithCommands >> updateToolBarButtons [

	toolBar fillWith: self rootCommandsGroup / 'ToolBar'
]
