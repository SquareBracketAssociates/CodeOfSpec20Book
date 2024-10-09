Class {
	#name : 'EmailPresenterWithStyling',
	#superclass : 'EmailPresenter',
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'layout' }
EmailPresenterWithStyling >> defaultLayout [

	| toLine subjectLine fromLine fromLabel |
	fromLabel := self newLabel
		yourself.
	fromLine := SpBoxLayout newTopToBottom
		add: fromLabel expand: false;
		add: from expand: false;
		yourself.
	toLine := SpBoxLayout newTopToBottom
		add: 'To:' expand: false;
		add: to expand: false;
		yourself.
	subjectLine := SpBoxLayout newTopToBottom
		add: 'Subject:' expand: false;
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

	super initializePresenters
]
