"
I present the GUI of a TrafficLights. The GUI is build using Spec.

To open me execute

```language=Pharo
TrafficPresenter new open.
```

###Instance Variables
	model:		<a TrafficLights>
	view:		<a SpMorphPresenter> presents the body
	body:		<a BorderedMorph> with three submorphs of the BaloonMorph class
	manualButton:		<a Button> switches lamps one by one in the manual mode, stops automatic switching
	autoButton:		<a Button> stops automatic switching, opens the input dialog to define durations of glow
	durationPanel:		<an InputPanelPresenter> it's button starts switching in the automatic mode
	quitButton:		<a Button> press to exit
###Implementation
A TrafficPresenter creates all subpresenters and morphs, creates a TrafficLights instance with the body morph.
"
Class {
	#name : #TrafficPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'body',
		'manualButton',
		'autoButton',
		'durationPanel',
		'quitButton',
		'model',
		'morphPresenter'
	],
	#category : #'CodeOfSpec20BookTrafficLights-UI'
}

{ #category : #initialization }
TrafficPresenter >> connectPresenters [

	manualButton action: [ model stop; changeLamp ].
	autoButton action: [ model stop. durationPanel show ].
	durationPanel action: [
		durationPanel hide.
		model
			setDurations: {
					durationPanel redDuration.
					durationPanel yellowDuration.
					durationPanel greenDuration };
			run ].
	quitButton action: [ self delete ]
]

{ #category : #layout }
TrafficPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
	     spacing: 5;
		  add: (SpBoxLayout newVertical 
					add: morphPresenter withConstraints: [ :c | c expand: false; height: 670; padding: 5 ];
					yourself ) withConstraints: [ :constr | constr width: 250; padding: 5 ];
		  add: (SpBoxLayout newVertical
					spacing: 5;
				   add: manualButton expand: false;
				   add: autoButton expand: false;
				   add: durationPanel;
				   addLast: quitButton expand: false;
				   yourself);
		  yourself
]

{ #category : #initialization }
TrafficPresenter >> initializeMorph [

	body := BorderedMorph new
		        color: Color lightGray;
		        extent: 240 @ 660.
	body addAllMorphs: {
			(BalloonMorph new
				 color: Color lightGray lighter;
				 borderColor: Color darkGray;
				 extent: 200 @ 200;
				 position: body position + (25 @ 25)).
			(BalloonMorph new
				 color: Color yellow;
				 borderColor: Color darkGray;
				 extent: 200 @ 200;
				 position: body position + (25 @ 235)).
			(BalloonMorph new
				 color: Color lightGray lighter;
				 borderColor: Color darkGray;
				 extent: 200 @ 200;
				 position: body position + (25 @ 445)) }.
	model := TrafficLights newWith: body.
]

{ #category : #initialization }
TrafficPresenter >> initializePresenters [

	self initializeMorph.
	morphPresenter := self instantiate: SpMorphPresenter.
	manualButton := self newButton.
	autoButton := self newButton.
	quitButton := self newButton.
	durationPanel := self instantiate: InputPanelPresenter.

	morphPresenter morph: body.
	manualButton
		label: 'Manual switch';
		icon: (self iconNamed: #smallDoIt).
	autoButton
		label: 'Auto switch';
		icon: (self iconNamed: #tools).
	quitButton
		label: 'Quit';
		icon: (self iconNamed: #smallQuit).
	durationPanel hide.
]

{ #category : #initialization }
TrafficPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'A traffic ligths model';
		initialExtent: 450 @ 710
]
