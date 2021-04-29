Class {
	#name : #ASDEFormUser,
	#superclass : #ASDEForm,
	#instVars : [
		'cancelLabel',
		'passwordLabel',
		'nachnameLabel',
		'gmailLabel',
		'benutzerLabel',
		'cancelCallback',
		'vornameLabel',
		'titleLabel',
		'isAjax',
		'submitLabel',
		'isDialog'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEFormUser >> benutzerLabel [
	^ benutzerLabel
]

{ #category : #accessing }
ASDEFormUser >> benutzerLabel: anObject [
	benutzerLabel := anObject
]

{ #category : #rendering }
ASDEFormUser >> benutzerNaneInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'text';
		label: benutzerLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model benutzerName: aString ];
		value: self model benutzerName
]

{ #category : #accessing }
ASDEFormUser >> cancelCallback [
	^ cancelCallback
]

{ #category : #accessing }
ASDEFormUser >> cancelCallback: anObject [
	cancelCallback := anObject
]

{ #category : #accessing }
ASDEFormUser >> cancelLabel [
	^ cancelLabel
]

{ #category : #accessing }
ASDEFormUser >> cancelLabel: anObject [
	cancelLabel := anObject
]

{ #category : #rendering }
ASDEFormUser >> gmailInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'text';
		label: gmailLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model gmail: aString ];
		value: self model gmail
]

{ #category : #accessing }
ASDEFormUser >> gmailLabel [
	^ gmailLabel
]

{ #category : #accessing }
ASDEFormUser >> gmailLabel: anObject [
	gmailLabel := anObject
]

{ #category : #initalize }
ASDEFormUser >> initialize [
	super initialize.
	self id: 'userFormCard'.
	self titleLabel: 'Benutzer Verwaltung'.
	self isAjax: false.
	self benutzerLabel: 'Benutzername'.
	self cancelLabel: 'abbrechen'.
	self gmailLabel: 'GMailName'.
	self nachnameLabel: 'Nachname'.
	self passwordLabel: 'Password'.
	self submitLabel: 'ok'.
	self vornameLabel: 'Vorname'.
	self isDialog: false.
]

{ #category : #accessing }
ASDEFormUser >> isAjax [
	^ isAjax
]

{ #category : #accessing }
ASDEFormUser >> isAjax: anObject [
	isAjax := anObject
]

{ #category : #accessing }
ASDEFormUser >> isDialog [
	^ isDialog
]

{ #category : #accessing }
ASDEFormUser >> isDialog: anObject [
	isDialog := anObject
]

{ #category : #rendering }
ASDEFormUser >> nachnameInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'text';
		label: nachnameLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model nachname: aString ];
		value: self model nachname
]

{ #category : #accessing }
ASDEFormUser >> nachnameLabel [
	^ nachnameLabel
]

{ #category : #accessing }
ASDEFormUser >> nachnameLabel: anObject [
	nachnameLabel := anObject
]

{ #category : #rendering }
ASDEFormUser >> passwordInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'password';
		label: passwordLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model password: aString ];
		value: self model password
]

{ #category : #accessing }
ASDEFormUser >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
ASDEFormUser >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #rendering }
ASDEFormUser >> renderCancelButtonOn: html [
	html anchor
		class: 'mdl-button mdl-js-button mdl-button--raised';
		callback: cancelCallback;
		with: cancelLabel
]

{ #category : #rendering }
ASDEFormUser >> renderContentOn: html [
	 self renderFormContentOn: html 
]

{ #category : #rendering }
ASDEFormUser >> renderFieldsOn: html [
	html render: self benutzerNaneInputWidget.
	html render: self passwordInputWidget.
	html render: self vornameInputWidget.
	html render: self nachnameInputWidget.
	
]

{ #category : #rendering }
ASDEFormUser >> renderFormContentOn: html [
	self renderFieldsOn: html.
	self isDialog ifFalse: [ self renderCancelButtonOn: html.
	self renderSubmitButtonOn: html ]
	
]

{ #category : #rendering }
ASDEFormUser >> renderSubmitButtonOn: html [
self isAjax ifTrue: [ html mdlButton
		raised;
		accentColor;
		beSubmit;
		class: 'mdl-button mdl-js-button mdl-button--raised';
		with: 'ok' ] ifFalse: [ html mdlButton
		raised;
		accentColor;
		beSubmit;
		class: 'mdl-button mdl-js-button mdl-button--raised';
		with: 'ok' ]
	
]

{ #category : #accessing }
ASDEFormUser >> submitLabel [
	^ submitLabel
]

{ #category : #accessing }
ASDEFormUser >> submitLabel: anObject [
	submitLabel := anObject
]

{ #category : #accessing }
ASDEFormUser >> titleLabel [
	^ titleLabel
]

{ #category : #accessing }
ASDEFormUser >> titleLabel: anObject [
	titleLabel := anObject
]

{ #category : #rendering }
ASDEFormUser >> vornameInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'text';
		label: vornameLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model vorname: aString ];
		value: self model vorname
]

{ #category : #accessing }
ASDEFormUser >> vornameLabel [
	^ vornameLabel
]

{ #category : #accessing }
ASDEFormUser >> vornameLabel: anObject [
	vornameLabel := anObject
]
