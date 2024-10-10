Class {
	#name : 'EmailPresenterWithStyling',
	#superclass : 'EmailPresenter',
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'layout' }
EmailPresenterWithStyling >> defaultLayout [

	| toLine subjectLine fromLine fromLabel toLabel subjectLabel |
	fromLabel := self newLabel
		label: 'From:';
		addStyle: 'fieldLabel';
		yourself.
	fromLine := SpBoxLayout newTopToBottom
		add: fromLabel expand: false;
		add: from expand: false;
		yourself.
	toLabel := self newLabel
		label: 'To:';
		addStyle: 'fieldLabel';
		yourself.
	toLine := SpBoxLayout newTopToBottom
		add: toLabel expand: false;
		add: to expand: false;
		yourself.
	subjectLabel := self newLabel
		label: 'Subject:';
		addStyle: 'fieldLabel';
		yourself.
	subjectLine := SpBoxLayout newTopToBottom
		add: subjectLabel expand: false;
		add: subject expand: false;
		yourself.
	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: fromLine expand: false;
		add: toLine expand: false;
		add: subjectLine expand: false;
		add: body;
		yourself
]

{ #category : 'initialization' }
EmailPresenterWithStyling >> initializePresenters [

	super initializePresenters.
	from addStyle: 'field'.
	to addStyle: 'field'.
	subject addStyle: 'field'.
	body addStyle: 'field'; addStyle: 'bodyField'
]

{ #category : 'initialization' }
EmailPresenterWithStyling >> modelChanged [

	super modelChanged.
	self model isDraft
		ifTrue: [
			self addStyle: 'draftMail'.
			from addStyle: 'draftMail.field'.
			to addStyle: 'draftMail.field'.
			subject addStyle: 'draftMail.field'.
			body addStyle: 'draftMail.field' ]
		ifFalse: [
			self removeStyle: 'draftMail'.
			from removeStyle: 'draftMail.field'.
			to removeStyle: 'draftMail.field'.
			subject removeStyle: 'draftMail.field'.
			body removeStyle: 'draftMail.field' ]
]
