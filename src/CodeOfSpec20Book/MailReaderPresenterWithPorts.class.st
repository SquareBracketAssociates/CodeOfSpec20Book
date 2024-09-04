"
My superclasses uses traditional means to connect presenters. I use ports.
"
Class {
	#name : 'MailReaderPresenterWithPorts',
	#superclass : 'MailReaderPresenter',
	#category : 'CodeOfSpec20Book-Chapter14',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter14'
}

{ #category : 'ports' }
MailReaderPresenterWithPorts >> defaultInputPort [

	^ SpModelPort newPresenter: self
]

{ #category : 'initialization' }
MailReaderPresenterWithPorts >> initializePresenters [

	content := EmailPresenterWithPorts new.
	noContent := NoEmailPresenter new
]

{ #category : 'updating' }
MailReaderPresenterWithPorts >> setModel: email [

	self read: email
]
