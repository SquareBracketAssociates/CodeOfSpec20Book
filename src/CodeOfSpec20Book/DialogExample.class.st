"
See the examples at the class side.
"
Class {
	#name : 'DialogExample',
	#superclass : 'SpPresenter',
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'examples' }
DialogExample class >> exampleAlert [

	SpAlertDialog new
		title: 'Inform example';
		label: 'You are seeing an inform dialog!';
		acceptLabel: 'Close this!';
		openModal
]

{ #category : 'examples' }
DialogExample class >> exampleConfirm [

	SpConfirmDialog new
		title: 'Confirm example';
		label: 'Are you sure?';
		acceptLabel: 'Sure!';
		cancelLabel: 'No, forget it';
		onAccept: [ :dialog| dialog alert: 'Yes!' ];
		onCancel: [ :dialog| dialog alert: 'No!' ];
		openModal
]
