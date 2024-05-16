"
I am the application for the `ColorChooser`.

Open a new `ColorChooser` with `ColorChooserApplication new start`.
"
Class {
	#name : 'ColorChooserApplication',
	#superclass : 'SpApplication',
	#category : 'CodeOfSpec20Book-Chapter06',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter06'
}

{ #category : 'running' }
ColorChooserApplication >> start [

	ColorChooser new
		application: self;
		open
]
