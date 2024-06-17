"
I use an overlay layout to overlay a button with a colored indicator.
"
Class {
	#name : 'OverlayLayoutExample',
	#superclass : 'SpPresenter',
	#instVars : [
		'button',
		'indicator'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
OverlayLayoutExample >> buttonLayout [

	^ SpOverlayLayout new
		child: button;
		addOverlay: self indicatorLayout withConstraints: [ :constraints |
			constraints vAlignStart; hAlignEnd ];
		yourself
]

{ #category : 'layout' }
OverlayLayoutExample >> defaultLayout [

	| buttonVBox |
	buttonVBox := SpBoxLayout newTopToBottom
		vAlignCenter;
		add: self buttonLayout height: 50;
		yourself.
	^ SpBoxLayout newLeftToRight
		hAlignCenter;
		add: buttonVBox width: 50;
		yourself
]

{ #category : 'private' }
OverlayLayoutExample >> indicator [

	^ RSBox new
		extent: 10@10;
		color: Color red;
		yourself
]

{ #category : 'layout' }
OverlayLayoutExample >> indicatorLayout [

	| counterVBox |
	counterVBox := SpBoxLayout newTopToBottom
		add: indicator withConstraints: [ :constraints | constraints height: 12; padding: 2 ];
		yourself.
	^ SpBoxLayout newLeftToRight
		add: counterVBox withConstraints: [ :constraints | constraints width: 12; padding: 2 ];
		yourself
]

{ #category : 'private' }
OverlayLayoutExample >> indicatorShape [

	^ RSBox new
		extent: 10@10;
		color: Color red;
		yourself
]

{ #category : 'initialization' }
OverlayLayoutExample >> initializePresenters [

	button := self newButton
		label: 'Inbox';
		yourself.
	indicator := (self instantiate: SpRoassalPresenter)
		script: [ :view | view addShape: self indicatorShape ];
		yourself
]
