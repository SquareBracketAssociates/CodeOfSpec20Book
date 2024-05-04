Class {
	#name : 'ImdbApp',
	#superclass : 'SpApplication',
	#category : 'CodeOfSpec20Book-Chapter03',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter03'
}

{ #category : 'initialization' }
ImdbApp >> initialize [

 	super initialize.
	self
		useBackend: #Morphic 
		with: ImdbConfiguration new
]
