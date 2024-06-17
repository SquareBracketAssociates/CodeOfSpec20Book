"
See the examples at the class side.
"
Class {
	#name : 'ColorSelectorExample',
	#superclass : 'SpPresenter',
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'examples' }
ColorSelectorExample class >> example [

	| selectedColors presenter colorTable dialogPresenter |
	selectedColors := Set new.
	presenter := SpPresenter new.
	colorTable := presenter newTable
		items: (Color red wheel: 10);
		addColumn: (SpCheckBoxTableColumn new
			evaluated: [ :color | selectedColors includes: color ];
			onActivation: [ :color | selectedColors add: color];
			onDeactivation: [ :color | selectedColors remove: color];
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn new
			evaluated: [ :color | '' ];
			displayBackgroundColor: [ :color | color ];
			yourself);
		hideColumnHeaders;
		yourself.
	presenter layout: (SpBoxLayout newTopToBottom
		add: colorTable;
		yourself).
	dialogPresenter := presenter openDialog.
	dialogPresenter
		title: 'Select colors';
		okAction: [ :dialog | dialog beOk ];
		whenClosedDo: [ dialogPresenter isOk
			ifTrue: [ selectedColors inspect ] ]
]
