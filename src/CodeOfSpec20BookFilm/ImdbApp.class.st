Class {
	#name : #ImdbApp,
	#superclass : #SpApplication,
	#category : #CodeOfSpec20BookFilm
}

{ #category : #initialization }
ImdbApp >> initialize [

 	super initialize.
	self
		useBackend: #Morphic 
		with: ImdbConfiguration new.
]
