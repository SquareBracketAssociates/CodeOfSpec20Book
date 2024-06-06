"
I display 9 tiles in 3 rows and 3 columns. I apply different horizontal and vertical alignments to each tile.
"
Class {
	#name : 'AlignmentExample',
	#superclass : 'SpPresenter',
	#instVars : [
		'northWest',
		'north',
		'northEast',
		'west',
		'center',
		'east',
		'southWest',
		'south',
		'southEast'
	],
	#category : 'CodeOfSpec20Book-Chapter11',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter11'
}

{ #category : 'accessing' }
AlignmentExample >> application [

	^ SpApplication new
		addStyleSheetFromString: '.application [
			.tile [
				Container { #borderWidth: 2, #borderColor: #black },
				Draw { #backgroundColor: #white } ]
		]';
		yourself
]

{ #category : 'layout' }
AlignmentExample >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: (self rowWithAll: { northWest . north . northEast });
		add: (self rowWithAll: { west . center . east });
		add: (self rowWithAll: { southWest . south . southEast });
		yourself
]

{ #category : 'initialization' }
AlignmentExample >> initializePresenters [

	northWest := self newTile: [ :tileLayout |
		tileLayout vAlignStart; hAlignStart ].
	north := self newTile: [ :tileLayout |
		tileLayout vAlignStart; hAlignCenter ].
	northEast := self newTile: [ :tileLayout |
		tileLayout vAlignStart; hAlignEnd ].
	west := self newTile: [ :tileLayout |
		tileLayout vAlignCenter; hAlignStart ].
	center := self newTile: [ :tileLayout |
		tileLayout vAlignCenter; hAlignCenter ].
	east := self newTile: [ :tileLayout |
		tileLayout vAlignCenter; hAlignEnd ].
	southWest := self newTile: [ :tileLayout |
		tileLayout vAlignEnd; hAlignStart ].
	south := self newTile: [ :tileLayout |
		tileLayout vAlignEnd; hAlignCenter ].
	southEast := self newTile: [ :tileLayout |
		tileLayout vAlignEnd; hAlignEnd ]
]

{ #category : 'private' }
AlignmentExample >> newLableOne [

	^ self newLabel
		label: 'One';
		yourself
]

{ #category : 'private' }
AlignmentExample >> newLableTwo [

	^ self newLabel
		label: 'two';
		yourself
]

{ #category : 'private' }
AlignmentExample >> newTile: alignmentBlock [

	| tileLayout |
	tileLayout := SpBoxLayout newTopToBottom
		add: self newLableOne;
		add: self newLableTwo;
		yourself.
	alignmentBlock value: tileLayout.
	^ SpPresenter new
		layout: tileLayout;
		addStyle: 'tile';
		yourself
]

{ #category : 'layout' }
AlignmentExample >> rowWithAll: tiles [

	| row |
	row := SpBoxLayout newLeftToRight
		spacing: 5;
		yourself.
	tiles do: [ :tile | row add: tile ].
	^ row
]
