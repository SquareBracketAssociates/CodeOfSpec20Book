"
I am a model of a traffic lights. I hold an array of Lamps.

###Instance Variables
	activeLamp:		<an Integer> an index of the switched on lamp
	lamps:		<an Array> of three Lamps and a fourth element that reference the second lamp
	mustRun:		<a Boolean> indicates if self is in a running mode
	stopwatch:		<a Stopwatch>
	view:		<a BorderedMorph> with three submorphs of the BaloonMorph class

###Public API and Key Messages

- run ""starts automatic switching""
- stop ""stops automatic switching""
- changeLamp ""switches next lamp""

To create an instance use the class method
```language=Pharo
newWith: aBorderedMorph
```
"
Class {
	#name : #TrafficLights,
	#superclass : #Object,
	#instVars : [
		'lamps',
		'activeLamp',
		'mustRun',
		'stopwatch',
		'morphView'
	],
	#category : #'CodeOfSpec20BookTrafficLights-Domain'
}

{ #category : #'instance creation' }
TrafficLights class >> newWith: aMorph [

	| traffic |
	traffic := self basicNew.
	traffic
		view: aMorph;
		initialize.
	^ traffic 
]

{ #category : #action }
TrafficLights >> changeLamp [

	(lamps at: activeLamp) switchOff.
	activeLamp := activeLamp % 4 + 1.
	(lamps at: activeLamp) switchOn
]

{ #category : #initialization }
TrafficLights >> initialize [

	lamps := {
		         (Lamp new: Color red for: 5 on: (morphView submorphs at: 1)).
		         (Lamp new: Color yellow for: 1 on: (morphView submorphs at: 2)).
		         (Lamp new: Color green for: 5 on: (morphView submorphs at: 3)).
		         nil }.
	lamps at: 4 put: (lamps at: 2).
	activeLamp := 2.
	(lamps at: activeLamp) switchOn.
	mustRun := false.
	stopwatch := Stopwatch new.
]

{ #category : #action }
TrafficLights >> run [

	mustRun := true.
	[
	[ mustRun ] whileTrue: [
		stopwatch activate.
		[ stopwatch duration seconds < (lamps at: activeLamp) duration ]
			whileTrue: [  ].
		stopwatch reset.
		self changeLamp ] ] fork
]

{ #category : #accessing }
TrafficLights >> setDurations: anArray [
	1 to: 3 do: [ :i | (lamps at: i) duration: (anArray at: i) ]
]

{ #category : #action }
TrafficLights >> stop [
	mustRun := false
]

{ #category : #accessing }
TrafficLights >> view: aMorph [
	morphView := aMorph 
]
