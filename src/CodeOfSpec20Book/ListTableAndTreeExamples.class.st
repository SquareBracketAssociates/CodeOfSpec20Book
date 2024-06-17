"
I collect examples of lists, tables, and trees. See the `examples` protocol at the class side.
"
Class {
	#name : 'ListTableAndTreeExamples',
	#superclass : 'SpPresenter',
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleComponentList [

	| list |
	list := {
		(SpLabelPresenter new
			label: 'Test 1';
			yourself).
		(SpImagePresenter new
			image: (self iconNamed: #smallOk);
			yourself).
		(SpButtonPresenter new
			label: 'A button';
			yourself).
		(SpImagePresenter new
			image: PolymorphSystemSettings pharoLogo asForm;
			yourself) }.
	SpComponentListPresenter new
		presenters: list;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleFilteringListWithFilterAtBottom [

	SpFilteringListPresenter new
		items: Collection withAllSubclasses;
		open;
		withWindowDo: [ :window |
			window title: 'SpFilteringListPresenter example' ]
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleFilteringListWithFilterAtTop [

	SpFilteringListPresenter new
		items: Collection withAllSubclasses;
		openWithLayout: SpFilteringListPresenter topLayout;
		withWindowDo: [ :window |
			window title: 'SpFilteringListPresenter example' ]
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleFilteringListWithGivenFilter [

	SpFilteringListPresenter new
		items: Collection withAllSubclasses;
		openWithLayout: SpFilteringListPresenter topLayout;
		applyFilter: 'ZZ';
		withWindowDo: [ :window |
			window title: 'SpFilteringListPresenter prefiltered example' ]
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleFilteringSelectableList [

	(SpFilteringSelectableListPresenter new
		items: Collection withAllSubclasses;
		layout: SpFilteringListPresenter topLayout;
		applyFilter: 'set';
		asWindow)
			title: 'SpFilteringSelectableListPresenter example';
			open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithClasses [

	SpListPresenter new
		items: Collection withAllSubclasses;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithClassesAndHeader [

	SpListPresenter new
		items: Collection withAllSubclasses;
		headerTitle: 'All Collection Classes';
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithClassesAndHiddenHeader [

	SpListPresenter new
		items: Collection withAllSubclasses;
		headerTitle: 'All Collection Classes';
		hideHeaderTitle;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithDecoratedItems [

	SpListPresenter new
		items: Collection withAllSubclasses;
		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];
		displayColor: [ :aClass |
			(aClass name endsWith: 'Set')
				ifTrue: [ Color green ]
				ifFalse: [ self theme textColor ] ];
		displayItalic: [ :aClass | aClass isAbstract ];
		displayBold: [ :aClass | aClass hasSubclasses ];
		displayUnderline: [ :aClass | aClass numberOfMethods > 10 ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithMultipleSelection [

	SpListPresenter new
		items: Collection withAllSubclasses;
		beMultipleSelection;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithSelectorsOfPointClass [

	SpListPresenter new
		items: Point methods;
		display: [ :item | item selector ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListWithSortedSelectorsOfPointClass [

	SpListPresenter new
		items: Point methods;
		display: [ :item | item selector ];
		sortingBlock: [ :a :b | a selector < b selector ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleListsWithDragAndDrop [

	| list1 list2 |
	list1 := SpListPresenter new.
	list1
		items: #( 'abc' 'def' 'xyz' );
		beMultipleSelection;
		dragEnabled: true.

	list2 := SpListPresenter new.
	list2 dropEnabled: true;
		wantsDrop: [ :transfer | transfer passenger allSatisfy: #isString ];
		acceptDrop: [ :transfer | list2 items: list2 items , transfer passenger ].

	SpPresenter new
		layout: (SpBoxLayout newLeftToRight
			add: list1;
			add: list2;
			yourself);
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTable [

	SpTablePresenter new
		addColumn: (SpStringTableColumn title: 'Number' evaluated: #yourself);
		addColumn: (SpStringTableColumn title: 'Hex' evaluated: #hex);
		showColumnHeaders;
		items: (1 to: 10);
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTableWithEditableItems [

	| items |
	items := String methods.
	SpTablePresenter new
		addColumn:
			(SpStringTableColumn new
				title: 'Editable selector name';
				evaluated: [ :m | m selector ];
				displayBold: [ :m | m selector isKeyword ];
				beEditable;
				onAcceptEdition: [ :m :t |
					Transcript
						nextPutAll: t;
						cr;
						endEntry ];
				 yourself);
		addColumn:
			(SpStringTableColumn title: 'Size' evaluated: #size)
				beSortable;
				showColumnHeaders;
				items: items;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTableWithIndexColumn [

	SpTablePresenter new
		addColumn: (SpIndexTableColumn title: 'My index');
		addColumn: (SpStringTableColumn title: 'Number' evaluated: #yourself);
		addColumn: (SpStringTableColumn title: 'Hex' evaluated: #hex);
		showColumnHeaders;
		items: (1 to: 10);
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTableWithSortableColumns [

	| classNameCompare methodCountSorter |
	classNameCompare := [ :c1 :c2 | c1 name < c2 name ].
	methodCountSorter := [ :c1 :c2 |
		c1 methodDictionary size threeWayCompareTo: c2 methodDictionary size ].

	SpTablePresenter new
		addColumn: ((SpStringTableColumn title: 'Name' evaluated: #name)
				compareFunction: classNameCompare);
		addColumn: ((SpStringTableColumn
				title: 'Methods'
				evaluated: [ :c | c methodDictionary size ]) sortFunction: methodCountSorter);
		items: Collection withAllSubclasses;
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTree [

	SpTreePresenter new
		roots: { Object };
		children: [ :aClass | aClass subclasses ];
		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];
		display: [ :aClass | aClass name ];
		expandPath: #( 1 1 3 );
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTreeTableWithFixedWidthColumn [

	SpTreeTablePresenter new
		beResizable;
		addColumn:
			(SpCompositeTableColumn new
				title: 'Classes';
				addColumn:
					(SpImageTableColumn evaluated: [ :aClass |
						self iconNamed: aClass systemIconName ]);
				addColumn: (SpStringTableColumn evaluated: #name);
				width: 250;
				beExpandable;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Methods';
				evaluated: [ :class | class methodDictionary size asString ]);
		roots: { Object };
		children: [ :aClass | aClass subclasses ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTreeTableWithNumbersInFirstColumn [

	| compositeColumn |
	compositeColumn := SpCompositeTableColumn new title: 'Classes';
		addColumn: (SpImageTableColumn evaluated: [ :aClass |
			self iconNamed: aClass systemIconName ]);
		addColumn: (SpStringTableColumn evaluated: [ :each | each name ] );
		yourself.
	SpTreeTablePresenter new
		beResizable;
		addColumn: (SpStringTableColumn new
			title: 'Methods';
			evaluated: [ :class | class methodDictionary size asString ]);
		addColumn: compositeColumn;
		roots: { Object };
		children: [ :aClass | aClass subclasses ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTreeTableWithTwoColumns [

	SpTreeTablePresenter new
		beResizable;
		addColumn:
			(SpCompositeTableColumn new
				title: 'Classes';
				addColumn:
					(SpImageTableColumn evaluated: [ :aClass |
						self iconNamed: aClass systemIconName ]);
				addColumn:
					(SpStringTableColumn evaluated: [ :each | each name ] );
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Methods';
				evaluated: [ :class | class methodDictionary size asString ]);
		roots: { Object };
		children: [ :aClass | aClass subclasses ];
		open
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTreeWithInitialSelection [

	| pathToSpPresenter |
	pathToSpPresenter := SpTreePresenter withAllSuperclasses reversed allButFirst.
	SpTreePresenter new
		roots: { Object };
		children: [ :aClass | aClass subclasses ];
		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];
		display: [ :aClass | aClass name ];
		open;
		selectPathByItems: pathToSpPresenter scrollToSelection: true
]

{ #category : 'examples' }
ListTableAndTreeExamples class >> exampleTreeWithMenu [

	| tree |
	tree := SpTreePresenter new.
	tree roots: { Object };
		children: [ :aClass | aClass subclasses ];
		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];
		display: [ :aClass | aClass name ];
		contextMenu: [
			SpMenuPresenter new
				addGroup: [ :group |
					group addItem: [ :item | item name: tree selectedItem asString ] ] ];
		open
]
