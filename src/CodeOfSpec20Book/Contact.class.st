"
I represent a contact with a name and a phone number.
"
Class {
	#name : 'Contact',
	#superclass : 'Object',
	#instVars : [
		'name',
		'phone'
	],
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'instance creation' }
Contact class >> name: aNameString phone: aPhoneString [

	^ self new
		name: aNameString;
		phone: aPhoneString;
		yourself
]

{ #category : 'testing' }
Contact >> hasMatchingText: aString [

	^ name includesSubstring: aString caseSensitive: false
]

{ #category : 'accessing' }
Contact >> name [

	^ name
]

{ #category : 'accessing' }
Contact >> name: aString [

	name := aString
]

{ #category : 'accessing' }
Contact >> phone [

	^ phone
]

{ #category : 'accessing' }
Contact >> phone: aString [

	phone := aString
]

{ #category : 'printing' }
Contact >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: name.
	aStream nextPut: $)
]
