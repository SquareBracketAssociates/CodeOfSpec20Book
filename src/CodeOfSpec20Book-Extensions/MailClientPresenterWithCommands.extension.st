Extension { #name : 'MailClientPresenterWithCommands' }

{ #category : '*CodeOfSpec20Book-Extensions' }
MailClientPresenterWithCommands class >> buildTemplateCommandsGroupWith: presenter forRoot: rootCommandGroup [

	<extensionCommands>

	(rootCommandGroup / 'MenuBar')
		register: (self buildTemplateMenuWith: presenter)
]

{ #category : '*CodeOfSpec20Book-Extensions' }
MailClientPresenterWithCommands class >> buildTemplateMenuWith: presenter [

	| letterTemplateCommand invitationTemplateCommand |
	invitationTemplateCommand := NewMailTemplateCommand new
		name: 'Invitation';
		bodyTemplate: 'Hi, you are invited to my party on <date>.';
		asSpecCommand.
	letterTemplateCommand := NewMailTemplateCommand new
		name: 'Letter';
		bodyTemplate: 'Dear <name>, I write you to inform you about <something>.';
		asSpecCommand.
	^ (CmCommandGroup named: 'Templates') asSpecGroup
		register: (invitationTemplateCommand context: presenter);
		register: (letterTemplateCommand context: presenter);
		yourself
]

{ #category : '*CodeOfSpec20Book-Extensions' }
MailClientPresenterWithCommands >> newFromTemplate: aString [

	editedEmail := Email new.
	editedEmail beDraft.
	editedEmail body: aString.
	reader updateLayoutForEmail: editedEmail.
	self modelChanged
]
