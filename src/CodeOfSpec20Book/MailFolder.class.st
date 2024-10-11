"
I represent a named folder in which `Email`s can be stored.
"
Class {
	#name : 'MailFolder',
	#superclass : 'Object',
	#instVars : [
		'emails',
		'name'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'instance creation' }
MailFolder class >> named: aString emails: aCollection [

	^ self new
		name: aString;
		emails: aCollection;
		yourself
]

{ #category : 'accessing' }
MailFolder >> content [

	^ emails
]

{ #category : 'accessing' }
MailFolder >> displayName [

	^ name
]

{ #category : 'private - accessing' }
MailFolder >> emails: aCollection [

	emails := aCollection
]

{ #category : 'intialization' }
MailFolder >> initialize [

	super initialize.
	emails := OrderedCollection new.
	name := 'New folder'
]

{ #category : 'testing' }
MailFolder >> isEmail [

	^ false
]

{ #category : 'private - accessing' }
MailFolder >> name: aString [

	name := aString
]
