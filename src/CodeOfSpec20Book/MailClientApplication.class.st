Class {
	#name : 'MailClientApplication',
	#superclass : 'SpApplication',
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'running' }
MailClientApplication >> start [

	(MailClientPresenterWithStyling on: MailAccount new)
		application: self;
		open
]

{ #category : 'styling' }
MailClientApplication >> styleSheet [

	| customStyleSheet |
	customStyleSheet := SpStyleVariableSTONReader fromString:
		'.application [
			.fieldLabel [ Font { #bold: false } ]
		]'.
	^ SpStyle defaultStyleSheet , customStyleSheet
]
