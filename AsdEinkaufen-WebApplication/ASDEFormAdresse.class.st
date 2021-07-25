Class {
	#name : #ASDEFormAdresse,
	#superclass : #ASDForm,
	#instVars : [
		'strLabel',
		'hsnrLabel',
		'plzLabel',
		'ortLabel'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEFormAdresse >> hsnrLabel [
	^ hsnrLabel
]

{ #category : #accessing }
ASDEFormAdresse >> hsnrLabel: anObject [
	hsnrLabel := anObject
]

{ #category : #initalize }
ASDEFormAdresse >> initialize [
	super initialize.
	self id: 'adressFormCard'.
	self strLabel: 'Strasse'.
	self hsnrLabel: 'Haus Nr.'.
	self plzLabel: 'Plz'.
	self ortLabel: 'Ort'
]

{ #category : #accessing }
ASDEFormAdresse >> ortLabel [
	^ ortLabel
]

{ #category : #accessing }
ASDEFormAdresse >> ortLabel: anObject [
	ortLabel := anObject
]

{ #category : #accessing }
ASDEFormAdresse >> plzLabel [
	^ plzLabel
]

{ #category : #accessing }
ASDEFormAdresse >> plzLabel: anObject [
	plzLabel := anObject
]

{ #category : #rendering }
ASDEFormAdresse >> renderBezOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Bez'.
			html mdlTextFieldInput
				id: html lastId;
				
				value: self model bez;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderContentOn: html [
	html mdlCard
		
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 500px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Adresse anlegen' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ super renderContentOn: html ] ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDEFormAdresse >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDEFormAdresse >> renderHsnrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Haus Nr.'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model hsnr;
				callback: [ :aString | self model hsnr: aString ] ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderOrtOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self ortLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ort;
				callback: [ :aString | self model ort: aString ] ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderPlzOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Postleitzahl'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model plz;
				callback: [ :aString | self model plz: aString ] ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderStrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Strasse'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model str;
				callback: [ :aString | self model str: aString ] ]
]

{ #category : #accessing }
ASDEFormAdresse >> strLabel [
	^ strLabel
]

{ #category : #accessing }
ASDEFormAdresse >> strLabel: anObject [
	strLabel := anObject
]
