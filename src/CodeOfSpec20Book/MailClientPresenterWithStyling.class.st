Class {
	#name : 'MailClientPresenterWithStyling',
	#superclass : 'MailClientPresenterWithDecorations',
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'initialization' }
MailClientPresenterWithStyling >> initializePresenters [

	super initializePresenters.
	reader := MailReaderPresenterWithStyling new
]
