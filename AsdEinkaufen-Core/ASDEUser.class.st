Class {
	#name : #ASDEUser,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'gmail',
		'pwdGmail',
		'password',
		'vorname',
		'nachname',
		'admin',
		'logged',
		'index',
		'indexLoggedUser',
		'benutzerName',
		'addresse',
		'type',
		'types'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #'instance creation' }
ASDEUser class >> benutzerName: login password: password [
	^ self new
		benutzerName: login;
		password: password;
		yourself
]

{ #category : #'instance creation' }
ASDEUser class >> benutzerName: login password: password admin: anAdmin [
	^ self new
		benutzerName: login;
		password: password;
		admin: anAdmin;
		yourself
]

{ #category : #voyage }
ASDEUser class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDEUser >> addresse [
	^ addresse
]

{ #category : #accessing }
ASDEUser >> addresse: anObject [
	addresse := anObject
]

{ #category : #accessing }
ASDEUser >> admin [
	^ admin
]

{ #category : #accessing }
ASDEUser >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
ASDEUser >> asAdmin [
	self type: #admin
]

{ #category : #accessing }
ASDEUser >> asCostumer [
	self type: #costumer
]

{ #category : #accessing }
ASDEUser >> asEmployee [
	self type: #employee
]

{ #category : #accessing }
ASDEUser >> asShopOwner [
	self type: #shopOwner
]

{ #category : #accessing }
ASDEUser >> benutzerName [
	^ benutzerName
]

{ #category : #accessing }
ASDEUser >> benutzerName: anObject [
	benutzerName := anObject
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionBenutzerName [
	<magritteDescription>
	^ MAStringDescription new
		priority: 30;
		label: 'Benutzer';
		accessor: #benutzerName;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Benutzernamen eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionNachname [
	<magritteDescription>
	^ MAStringDescription new
		priority: 20;
		label: 'Nachname';
		accessor: #nachname;
		beRequired;
		requiredErrorMessage: 'Bitte geben Sie Ihren Nachnamen ein';
		comment: 'Bitte Ihren Nachnamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionPassword [
	<magritteDescription>
	^ MAStringDescription new
		priority: 40;
		label: 'Password';
		accessor: #password;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Passwort eingeben';
		comment: 'Bitte Ihr Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionPwdGmail [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Password Gmail';
		accessor: #pwdGmail;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Gmail Passwort eingeben';
		comment: 'Bitte Ihr Gmail Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDEUser >> descriptionVorname [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Vorname';
		accessor: #vorname;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Vornamen eingeben';
		comment: 'Bitte Ihren Vornamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDEUser >> gmail [
	^ gmail
]

{ #category : #accessing }
ASDEUser >> gmail: anObject [
	gmail := anObject
]

{ #category : #'magritte descriptions' }
ASDEUser >> gmailDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Gmail Adr.';
		accessor: #gmail;
		comment: 'bitte Ihre Email Adresse eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDEUser >> index [
	^ index
]

{ #category : #accessing }
ASDEUser >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ASDEUser >> indexLoggedUser [
	^ indexLoggedUser
]

{ #category : #accessing }
ASDEUser >> indexLoggedUser: anObject [
	indexLoggedUser := anObject
]

{ #category : #initialization }
ASDEUser >> initialize [
	super initialize.
	self logged: false.
	self admin: false.
	self indexLoggedUser: nil.
	
	types := OrderedCollection
		newFrom: {#admin . #costumer . #shopOwner . #employee}.
	self type: #costumer
]

{ #category : #testing }
ASDEUser >> isAdmin [ 
^ self admin
]

{ #category : #testing }
ASDEUser >> isLogged [
	^ self logged
]

{ #category : #accessing }
ASDEUser >> logged [
	^ logged
]

{ #category : #accessing }
ASDEUser >> logged: anObject [
	logged := anObject
]

{ #category : #accessing }
ASDEUser >> nachname [
	^ nachname
]

{ #category : #accessing }
ASDEUser >> nachname: anObject [
	nachname := anObject
]

{ #category : #accessing }
ASDEUser >> password [
	^ password
]

{ #category : #accessing }
ASDEUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
ASDEUser >> pwdGmail [
	^ pwdGmail
]

{ #category : #accessing }
ASDEUser >> pwdGmail: anObject [
	pwdGmail := anObject
]

{ #category : #accessing }
ASDEUser >> type [
	^ type
]

{ #category : #accessing }
ASDEUser >> type: anObject [
	type := anObject
]

{ #category : #accessing }
ASDEUser >> types [
	^ types
]

{ #category : #accessing }
ASDEUser >> vorname [
	^ vorname
]

{ #category : #accessing }
ASDEUser >> vorname: anObject [
	vorname := anObject
]
