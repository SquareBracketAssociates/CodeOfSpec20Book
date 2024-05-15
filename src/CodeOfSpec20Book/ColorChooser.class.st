"
I am a small color chooser that shows the print string and the HEX code of the chosen color.
The chosen color can be made lighter and darker by pressing buttons.
"
Class {
	#name : 'ColorChooser',
	#superclass : 'SpPresenter',
	#instVars : [
		'colorList',
		'colorDetails',
		'colorBox',
		'lighterButton',
		'darkerButton',
		'currentColor'
	],
	#category : 'CodeOfSpec20Book-Chapter06',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter06'
}

{ #category : 'test support' }
ColorChooser >> boxColor [

	^ colorBox canvas color
]

{ #category : 'test support' }
ColorChooser >> clickColorAtIndex: index [

	colorList clickAtIndex: index
]

{ #category : 'test support' }
ColorChooser >> clickDarkerButton [

	darkerButton click
]

{ #category : 'test support' }
ColorChooser >> clickLighterButton [

	lighterButton click
]

{ #category : 'initialization' }
ColorChooser >> connectPresenters [

	colorList whenSelectionChangedDo: [ :selection | | details |
		details := selection selectedItem
			ifNil: [
				colorBox canvas background: Color transparent; signalUpdate.
				colorDetails text: '' ]
			ifNotNil: [ :selectedColor | self updateColor: selectedColor ] ]
]

{ #category : 'private' }
ColorChooser >> darker [

	self updateColor: currentColor darker
]

{ #category : 'private' }
ColorChooser >> defaultColors [

	"^ OrderedCollection new
		addAll: (Color red wheel: 20);
		add: Color white;
		add: Color black;
		yourself."
	^ {
		Color red .
		Color orange .
		Color yellow .
		Color green .
		Color magenta .
		Color cyan .
		Color blue .
		Color purple .
		Color pink .
		Color brown .
		Color white .
		Color gray .
		Color black }
]

{ #category : 'layout' }
ColorChooser >> defaultLayout [

	| colorBoxAndDetails buttons |
	buttons := SpBoxLayout newLeftToRight
		spacing: 5;
		add: lighterButton;
		add: darkerButton;
		yourself.
	colorBoxAndDetails := SpBoxLayout newTopToBottom
		spacing: 5;
		add: colorBox;
		add: buttons expand: false;
		add: colorDetails;
		yourself.
	^ SpBoxLayout newLeftToRight
		spacing: 5;
		add: colorList expand: false;
		add: colorBoxAndDetails;
		yourself
]

{ #category : 'private' }
ColorChooser >> detailsFor: color [

	^ String streamContents: [ :stream |
		stream
			print: color;
			cr; cr;
			nextPut: $#;
			nextPutAll: color asHexString ]
]

{ #category : 'test support' }
ColorChooser >> detailsText [

	^ colorDetails text
]

{ #category : 'initialization' }
ColorChooser >> initialize [

	super initialize.
	currentColor := Color transparent
]

{ #category : 'initialization' }
ColorChooser >> initializePresenters [

	colorList := self newList
		display: [ :color | '' ];
		displayBackgroundColor: [ :color | color ];
		yourself.
	colorBox := self instantiate: SpRoassalPresenter.
	lighterButton := self newButton
		label: 'Lighter';
		action: [ self lighter ];
		yourself.
	darkerButton := self newButton
		label: 'Darker';
		action: [ self darker ];
		yourself.
	colorDetails := self newText
]

{ #category : 'initialization' }
ColorChooser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Color Chooser';
		initialExtent: 400@294
]

{ #category : 'private' }
ColorChooser >> lighter [

	self updateColor: currentColor lighter
]

{ #category : 'private' }
ColorChooser >> updateColor: color [

	currentColor := color.
	colorBox canvas background: currentColor; signalUpdate.
	colorDetails text: (self detailsFor: currentColor)
]

{ #category : 'initialization' }
ColorChooser >> updatePresenter [

	colorList items: self defaultColors
]
