Class {
	#name : #ASDEFormShop,
	#superclass : #ASDEForm,
	#instVars : [
		'titelLabel',
		'titleTextLabel',
		'textLabel',
		'cssFileLabel',
		'nameLabel',
		'ausliefernJITLabel',
		'categoryLabel',
		'categorieCollection',
		'selectedComponentView'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEFormShop >> ausliefernJITLabel [
	^ ausliefernJITLabel
]

{ #category : #accessing }
ASDEFormShop >> ausliefernJITLabel: anObject [
	ausliefernJITLabel := anObject
]

{ #category : #accessing }
ASDEFormShop >> categorieCollection [
	| categorieColl |
	categorieColl:=OrderedCollection new.
	self session model shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #accessing }
ASDEFormShop >> categorieCollection: anObject [
	categorieCollection := anObject
]

{ #category : #accessing }
ASDEFormShop >> categoryLabel [
	^ categoryLabel
]

{ #category : #accessing }
ASDEFormShop >> categoryLabel: anObject [
	categoryLabel := anObject
]

{ #category : #accessing }
ASDEFormShop >> cssFileLabel [
	^ cssFileLabel
]

{ #category : #accessing }
ASDEFormShop >> cssFileLabel: anObject [
	cssFileLabel := anObject
]

{ #category : #initalize }
ASDEFormShop >> initialize [
	super initialize.
	self id: 'shopFormCard'.
	self titelLabel: 'Tiel'.
	self titleTextLabel: 'Titel Text'.
	self textLabel: 'Text'.
	self cssFileLabel: 'Css'.
	self nameLabel: 'Shop Name'.
	self ausliefernJITLabel: 'Sofort Lieferung'.
	self categoryLabel: 'Shop Kategorie'.
	
]

{ #category : #accessing }
ASDEFormShop >> nameLabel [
	^ nameLabel
]

{ #category : #accessing }
ASDEFormShop >> nameLabel: anObject [
	nameLabel := anObject
]

{ #category : #rendering }
ASDEFormShop >> renderAusliefernJITOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self ausliefernJITLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ausliefernJIT;
				callback: [ :aString | self model ausliefernJIT: aString ] ]
]

{ #category : #rendering }
ASDEFormShop >> renderCategoryOn: html [
	| selectedEntity |
	html
		render:
			(MDLSelectWidget
				possibilities: self categorieCollection asArray
				inputLabel: self categoryLabel
				labelBlock: #asString
				callback:
					[ :input | 
					selectedEntity := input.
					self model category: input ] yourself)	"self categorieCollection asArray"
]

{ #category : #rendering }
ASDEFormShop >> renderContentOn: html [
	html mdlCard
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 500px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Shop anlegen' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ super renderContentOn: html ] ]
]

{ #category : #rendering }
ASDEFormShop >> renderCssFileOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self cssFileLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model cssFile;
				callback: [ :aString | self model cssFile: aString ] ]
]

{ #category : #rendering }
ASDEFormShop >> renderFieldsOn: html [
	self renderTitelOn: html.
	self renderTitleTextOn: html.
	self renderTextOn: html.
	"self renderCssFileOn: html."
	self renderNameOn: html.
	self renderAusliefernJITOn: html.
	self renderCategoryOn: html
]

{ #category : #rendering }
ASDEFormShop >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDEFormShop >> renderNameOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self nameLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model name;
				callback: [ :aString | self model name: aString ] ]
]

{ #category : #rendering }
ASDEFormShop >> renderTextOn: html [
	html
		render:
			(ASDMATinymceWidget new
		beFloatingLabel;
		type: 'text';
		label: self textLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model text: aString ];
		value: self model text)	"self categorieCollection asArray"


]

{ #category : #rendering }
ASDEFormShop >> renderTitelOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self titelLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model titel;
				callback: [ :aString | self model titel: aString ] ]
]

{ #category : #rendering }
ASDEFormShop >> renderTitleTextOn: html [

	html
		render:
			(ASDMATinymceWidget new
				beFloatingLabel;
				type: 'text';
				label: self titleTextLabel;
				pattern: '^\S+$' errorMessage: 'kein leerstring';
				callback: [ :aString | self model titleText: aString ];
				value: self model titleText)	"self categorieCollection asArray"


]

{ #category : #accessing }
ASDEFormShop >> selectedComponentView [
	^ selectedComponentView
]

{ #category : #accessing }
ASDEFormShop >> selectedComponentView: aBoolean [ 
	selectedComponentView := aBoolean
]

{ #category : #accessing }
ASDEFormShop >> textLabel [
	^ textLabel
]

{ #category : #accessing }
ASDEFormShop >> textLabel: anObject [
	textLabel := anObject
]

{ #category : #accessing }
ASDEFormShop >> titelLabel [
	^ titelLabel
]

{ #category : #accessing }
ASDEFormShop >> titelLabel: anObject [
	titelLabel := anObject
]

{ #category : #accessing }
ASDEFormShop >> titleTextLabel [
	^ titleTextLabel
]

{ #category : #accessing }
ASDEFormShop >> titleTextLabel: anObject [
	titleTextLabel := anObject
]
