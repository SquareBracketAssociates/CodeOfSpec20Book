"
I manage a list of `Contact`s.
"
Class {
	#name : 'ContactBook',
	#superclass : 'Object',
	#instVars : [
		'contacts'
	],
	#classInstVars : [
		'coworkers'
	],
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'accessing' }
ContactBook class >> coworkers [

	^ coworkers ifNil: [
		coworkers := self new
			add: 'Stef' phone: '112 378';
			add: 'Pavel' phone: '898 678';
			add: 'Marcus' phone: '444 888';
			yourself ]
]

{ #category : 'accessing' }
ContactBook class >> reset [

	<script>
	coworkers := nil
]

{ #category : 'accessing' }
ContactBook >> add: contactName phone: phone [

	| contact |
	contact := Contact name: contactName phone: phone.
	self addContact: contact.
	^ contact
]

{ #category : 'accessing' }
ContactBook >> addContact: aContact [

	contacts add: aContact
]

{ #category : 'accessing' }
ContactBook >> addContact: newContact after: contactAfter [

	contacts add: newContact after: contactAfter
]

{ #category : 'accessing' }
ContactBook >> contents [

	^ contacts
]

{ #category : 'accessing' }
ContactBook >> findContactsWithText: aText [

	^ contacts select: [ :each | each hasMatchingText: aText ]
]

{ #category : 'testing' }
ContactBook >> includesContact: aContact [

	^ contacts includes: aContact
]

{ #category : 'initialization' }
ContactBook >> initialize [

	super initialize.
	contacts := OrderedCollection new
]

{ #category : 'accessing' }
ContactBook >> removeContact: aContact [

	contacts remove: aContact
]

{ #category : 'accessing' }
ContactBook >> size [

	^ contacts size
]
