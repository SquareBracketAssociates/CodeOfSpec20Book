Class {
	#name : 'ImdbMorphicConfiguration',
	#superclass : 'SpMorphicConfiguration',
	#category : 'CodeOfSpec20Book-Chapter04',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter04'
}

{ #category : 'configuring' }
ImdbMorphicConfiguration >> configure: anApplication [

	super configure: anApplication.
	"There are ways to write/read this from strings or files,
	 but this is how you do it programatically."
	self styleSheet
		addClass: 'header' with: [ :style |
			style
				addPropertyFontWith: [ :font | font bold: true ];
				addPropertyDrawWith: [ :draw | draw color: Color red ] ]
]
