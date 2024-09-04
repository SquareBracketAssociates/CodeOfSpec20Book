"
I represent a email with `from` and `to` addresses, a `subject`, and a `body`. My instances have a state: received, draft, or sent.
"
Class {
	#name : 'Email',
	#superclass : 'Object',
	#classTraits : 'TObservable classTrait',
	#instVars : [
		'from',
		'to',
		'subject',
		'body',
		'status'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'accessing' }
Email >> beDraft [

	status := #draft
]

{ #category : 'accessing' }
Email >> beReceived [

	status := #received
]

{ #category : 'accessing' }
Email >> beSent [

	status := #sent
]

{ #category : 'accessing' }
Email >> body [

	^ body
]

{ #category : 'accessing' }
Email >> body: aString [

	body := aString
]

{ #category : 'accessing' }
Email >> content [

	^ Array new
]

{ #category : 'accessing' }
Email >> displayName [

	^ subject
]

{ #category : 'accessing' }
Email >> from [

	^ from
]

{ #category : 'accessing' }
Email >> from: aString [

	from := aString
]

{ #category : 'initialization' }
Email >> initialize [

	super initialize.
	self beDraft
]

{ #category : 'testing' }
Email >> isDraft [

	^ status = #draft
]

{ #category : 'testing' }
Email >> isEmail [

	^ true
]

{ #category : 'testing' }
Email >> isReceived [

	^ status = #received
]

{ #category : 'testing' }
Email >> isSent [

	^ status = #sent
]

{ #category : 'accessing' }
Email >> subject [

	^ subject
]

{ #category : 'accessing' }
Email >> subject: aString [

	subject := aString
]

{ #category : 'accessing' }
Email >> to [

	^ to
]

{ #category : 'accessing' }
Email >> to: aString [

	to := aString
]
