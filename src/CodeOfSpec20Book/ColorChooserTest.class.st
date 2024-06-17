Class {
	#name : 'ColorChooserTest',
	#superclass : 'TestCase',
	#instVars : [
		'chooser'
	],
	#category : 'CodeOfSpec20Book-Chapter05',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter05'
}

{ #category : 'running' }
ColorChooserTest >> tearDown [

	chooser ifNotNil: [ chooser delete ].
	super tearDown
]

{ #category : 'tests' }
ColorChooserTest >> testChooseColor [
	"When the user chooses a color in the list,
	 the color box shows the color
	 and the details show the print string and the HEX code."

	chooser := ColorChooser new.
	chooser open.

	chooser clickColorAtIndex: 1.
	self assert: chooser boxColor equals: Color red.
	self assert: chooser detailsText equals: 'Color red\\#FF0000' withCRs.

	chooser clickColorAtIndex: 7.
	self assert: chooser boxColor equals: Color blue.
	self assert: chooser detailsText equals: 'Color blue\\#0000FF' withCRs
]

{ #category : 'tests' }
ColorChooserTest >> testDarker [
	"When the user presses the 'Darker' button,
	 the color box shows the darker color
	 and the details show the print string and the HEX code."

	chooser := ColorChooser new.
	chooser open.

	chooser clickColorAtIndex: 1.
	chooser clickDarkerButton.
	self assert: chooser boxColor equals: (Color r: 0.9198435972629521 g: 0.0 b: 0.0 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 0.9198435972629521 g: 0.0 b: 0.0 alpha: 1.0)\\#EB0000' withCRs.

	chooser clickDarkerButton.
	self assert: chooser boxColor equals: (Color r: 0.8396871945259042 g: 0.0 b: 0.0 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 0.8396871945259042 g: 0.0 b: 0.0 alpha: 1.0)\\#D60000' withCRs.

	chooser clickColorAtIndex: 7.
	chooser clickDarkerButton.
	self assert: chooser boxColor equals: (Color r: 0.0 g: 0.0 b: 0.9198435972629521 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 0.0 g: 0.0 b: 0.9198435972629521 alpha: 1.0)\\#0000EB' withCRs
]

{ #category : 'tests' }
ColorChooserTest >> testDefault [
	"When a ColorChooser opens without a color,
	 the color box shows a transparent color
	 and the details are empty."

	chooser := ColorChooser new.
	chooser open.

	self assert: chooser boxColor equals: Color transparent.
	self assert: chooser detailsText equals: ''
]

{ #category : 'tests' }
ColorChooserTest >> testInitialization [
	"When a ColorChooser opens on a color,
	 the color box shows that color
	 and the details show the print string and the HEX code."

	chooser := ColorChooser on: Color palePeach.
	chooser open.

	self assert: chooser boxColor equals: Color palePeach.
	self assert: chooser detailsText equals: 'Color palePeach\\#FFEDD5' withCRs
]

{ #category : 'tests' }
ColorChooserTest >> testInitializeWindow [

	| window |
	chooser := ColorChooser new.
	window := chooser open.
	self assert: window isBuilt.
	self assert: window title equals: 'Color Chooser'.
	self assert: window initialExtent equals: 400@294
]

{ #category : 'tests' }
ColorChooserTest >> testLighter [
	"When the user presses the 'Lighter' button,
	 the color box shows the ligher color
	 and the details show the print string and the HEX code."

	chooser := ColorChooser new.
	chooser open.

	chooser clickColorAtIndex: 1.
	chooser clickLighterButton.
	self assert: chooser boxColor equals: (Color r: 1.0 g: 0.030303030303030304 b: 0.030303030303030304 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 1.0 g: 0.030303030303030304 b: 0.030303030303030304 alpha: 1.0)\\#FF0707' withCRs.

	chooser clickLighterButton.
	self assert: chooser boxColor equals: (Color r: 1.0 g: 0.06060606060606061 b: 0.06060606060606061 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 1.0 g: 0.06060606060606061 b: 0.06060606060606061 alpha: 1.0)\\#FF0F0F' withCRs.

	chooser clickColorAtIndex: 7.
	chooser clickLighterButton.
	self assert: chooser boxColor equals: (Color r: 0.030303030303030304 g: 0.030303030303030304 b: 1.0 alpha: 1.0).
	self assert: chooser detailsText equals: '(Color r: 0.030303030303030304 g: 0.030303030303030304 b: 1.0 alpha: 1.0)\\#0707FF' withCRs
]
