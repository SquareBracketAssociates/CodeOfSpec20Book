"
I display fields for all aspects of an `Email`.
"
Class {
	#name : 'EmailPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'from',
		'to',
		'subject',
		'body'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'accessing' }
EmailPresenter >> beEditable [

	from editable: true.
	to editable: true.
	subject editable: true.
	body editable: true
]

{ #category : 'accessing' }
EmailPresenter >> beReadOnly [

	from editable: false.
	to editable: false.
	subject editable: false.
	body editable: false
]

{ #category : 'initialization' }
EmailPresenter >> connectPresenters [

	from whenTextChangedDo: [ :text | self model from: text ].
	to whenTextChangedDo: [ :text | self model to: text ].
	subject whenTextChangedDo: [ :text | self model subject: text ].
	body whenTextChangedDo: [ :text | self model body: text ]
]

{ #category : 'layout' }
EmailPresenter >> defaultLayout [

	| toLine subjectLine fromLine |
	fromLine := SpBoxLayout newTopToBottom
		add: 'From:' expand: false;
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
EmailPresenter >> initialize [

	self model: Email new.
	super initialize
]

{ #category : 'initialization' }
EmailPresenter >> initializePresenters [

	from := self newTextInput.
	to := self newTextInput.
	subject := self newTextInput.
	body := self newText
]

{ #category : 'initialization' }
EmailPresenter >> modelChanged [

	from text: (self model from ifNil: [ '' ]).
	to text: (self model to ifNil: [ '' ]).
	subject text: (self model subject ifNil: [ '' ]).
	body text: (self model body ifNil: [ '' ])
]
