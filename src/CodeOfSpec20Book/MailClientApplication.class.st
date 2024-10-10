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
			.fieldLabel [ Font { #size: 12 }, Draw { #color: #blue } ],
			.field [ Draw { #backgroundColor: #lightYellow } ],
			.draftMail [
				.field [ Draw { #backgroundColor: #pink } ]
				],
			.bodyField [ Container { #borderWidth: 1, #borderColor: #black } ]
		]'.
	^ super styleSheet , customStyleSheet
]
