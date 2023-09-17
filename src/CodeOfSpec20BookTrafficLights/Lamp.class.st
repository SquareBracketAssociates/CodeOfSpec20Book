"
I am a model of a lamp and I am a part of a traffic lights model.
I know my color, duration of glow, state (on/off) and the reference to my view.

###Instance Variables
	color:		<a Color>
	duration:		<an Integer> (in seconds)
	switchedOn:		<a Boolean>
	view:		<a BaloonMorph>

To create an instance use the class method 
```language=Pharo
new: aColor for: time on: aMorph
```
###Public API 
- switchOn
- switchOff

"
Class {
	#name : #Lamp,
	#superclass : #Object,
	#instVars : [
		'color',
		'duration',
		'switchedOn',
		'morphView'
	],
	#category : #'CodeOfSpec20BookTrafficLights-Domain'
}

{ #category : #'instance creation' }
Lamp class >> new: aColor for: time on: aMorph [

	^ self new
		  color: aColor;
		  duration: time;
		  view: aMorph
]

{ #category : #accessing }
Lamp >> color: aColor [

	color := aColor
]

{ #category : #accessing }
Lamp >> duration [

	^ duration
]

{ #category : #accessing }
Lamp >> duration: anNumber [
	duration := anNumber
]

{ #category : #printing }
Lamp >> handles?

	^ [ true 
]

{ #category : #initialization }
Lamp >> initialize [

	super initialize.
	color := Color red.
	duration := 5.
	switchedOn := false.
	self morphView: CircleMorph new.
]

{ #category : #accessing }
Lamp >> isSwitchedOn [

	^ switchedOn
]

{ #category : #accessing }
Lamp >> morphView: aMorph [

	morphView := aMorph
]

{ #category : #printing }
Lamp >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	color name printOn: aStream.
	aStream nextPut: $,.
	duration printOn: aStream.
	aStream nextPut: $)
]

{ #category : #action }
Lamp >> switchOff [

	switchedOn := false.
	morphView color: Color lightGray lighter.
]

{ #category : #action }
Lamp >> switchOn [

	switchedOn := true.
	morphView color: color
]

{ #category : #accessing }
Lamp >> view: anObject [

	morphView := anObject
]
