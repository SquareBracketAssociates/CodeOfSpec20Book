"
My superclasses uses traditional means to connect presenters. I use ports.
"
Class {
	#name : 'EmailPresenterWithPorts',
	#superclass : 'EmailPresenter',
	#category : 'CodeOfSpec20Book-Chapter14',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter14'
}

{ #category : 'initialization' }
EmailPresenterWithPorts >> connectPresenters [

	from transmitDo: [ :text | self model from: text ].
	to transmitDo: [ :text | self model to: text ].
	subject transmitDo: [ :text | self model subject: text ].
	body transmitDo: [ :text | self model body: text ]
]
