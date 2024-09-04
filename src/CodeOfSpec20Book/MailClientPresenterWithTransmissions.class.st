"
My superclasses uses traditional means to connect presenters. I use transmissions.
"
Class {
	#name : 'MailClientPresenterWithTransmissions',
	#superclass : 'MailClientPresenterWithDecorations',
	#category : 'CodeOfSpec20Book-Chapter14',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter14'
}

{ #category : 'examples' }
MailClientPresenterWithTransmissions class >> example [

	(self on: MailAccount new) open
]

{ #category : 'initialization' }
MailClientPresenterWithTransmissions >> connectPresenters [

	account
		transmitTo: reader
		postTransmission: [ :destination :origin :selectedFolderOrEmail |
			self updateAfterSelectionChangedTo: selectedFolderOrEmail ]
]

{ #category : 'initialization' }
MailClientPresenterWithTransmissions >> initializePresenters [

	super initializePresenters.
	account := MailAccountPresenterWithPorts on: self model.
	reader := MailReaderPresenterWithPorts new
]
