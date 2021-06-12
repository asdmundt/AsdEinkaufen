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
		'categoryLabel'
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
	self categoryLabel: 'Shop Kategorie'
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
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self categoryLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model category;
				callback: [ :aString | self model category: aString ] ]
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
	self renderCssFileOn: html.
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
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self textLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model text;
				callback: [ :aString | self model text: aString ] ]
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
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self titleTextLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model titleText;
				callback: [ :aString | self model titleText: aString ] ]
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
