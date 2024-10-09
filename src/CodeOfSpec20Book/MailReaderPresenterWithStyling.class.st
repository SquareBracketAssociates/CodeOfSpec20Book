Class {
	#name : 'MailReaderPresenterWithStyling',
	#superclass : 'MailReaderPresenter',
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'initialization' }
MailReaderPresenterWithStyling >> initializePresenters [

	content := EmailPresenterWithStyling new.
	noContent := NoEmailPresenter new
]
