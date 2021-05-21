Class {
	#name : #ASDEDbModel,
	#superclass : #Object,
	#instVars : [
		'users',
		'loggedUsers'
	],
	#classInstVars : [
		'uniqueInstancePlanung'
	],
	#category : #'AsdEinkaufen-Core-Utils'
}

{ #category : #voyage }
ASDEDbModel class >> createAdmin [
	(ASDEUser benutzerName: 'admin' password: 'pwd' admin: true) save
]

{ #category : #'data sample' }
ASDEDbModel class >> createDemoData [
	(ASDEUser benutzerName: 'admin' password: 'xyz' admin: false) save.
	ASDEKategorie name: 'Elektronik' andType: 'shop' save.
	ASDEKategorie name: 'Baumarkt' andType: 'shop' save.
	ASDEKategorie name: 'Textilien' andType: 'shop' save.
	ASDEKategorie name: 'SecondHand' andType: 'shop' save.
	ASDEKategorie name: 'Moebel' andType: 'shop' save.
	ASDEKategorie name: 'Werkzeug' andType: 'shop' save.
	ASDEKategorie name: 'Multimedia' andType: 'artikelArtKategorie' save.
	ASDEKategorie name: 'Computer' andType: 'artikelArtKategorie' save.
	ASDEKategorie
		name: 'ComputerKomponenten'
		andType: 'artikelArtKategorie' save.
	ASDEKategorie name: 'Lampen' andType: 'artikelArtKategorie' save.
	ASDEKategorie name: 'Moebel' andType: 'artikelArtKategorie' save.
	ASDEKategorie
		name: 'ElektronikKomponenten'
		andType: 'artikelArtKategorie' save.
	ASDEKategorie name: 'Boxen' andType: 'artikelOberKategorie' save.
	ASDEKategorie name: 'Reciever' andType: 'artikelOberKategorie' save.
	ASDEKategorie name: 'Mp3Player' andType: 'artikelOberKategorie' save.
	ASDEKategorie name: 'TV' andType: 'artikelOberKategorie' save.
	ASDEKategorie name: 'Satelit' andType: 'artikelOberKategorie' save.
	ASDEKategorie
		name: 'ElektronikKomponenten'
		andType: 'artikelOberKategorie' save
]

{ #category : #'default values' }
ASDEDbModel class >> defaultAdminLogin [
   ^ 'admin'
]

{ #category : #'default values' }
ASDEDbModel class >> defaultAdminPassword [
   ^ 'topsecret'
]

{ #category : #voyage }
ASDEDbModel class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'default values' }
ASDEDbModel class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDEDbModel >> addLoggedUser: aUser [
	aUser logged: true.
	aUser save.
]

{ #category : #operations }
ASDEDbModel >> artCategories [
	^ ASDEKategorie selectMany: [ :each | each type = 'artikelArtKategorie' ]
]

{ #category : #operations }
ASDEDbModel >> artikelCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'artikelKategorie' ]
]

{ #category : #initialization }
ASDEDbModel >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDEDbModel >> loggedUsers [
	^ ASDEUser selectMany: [ :each | each logged = true ]
]

{ #category : #accessing }
ASDEDbModel >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDEDbModel >> oberCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'artikelOberKategorie' ]
]

{ #category : #operations }
ASDEDbModel >> shopCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'shop' ]
]

{ #category : #operations }
ASDEDbModel >> storeObject: aObject [
	aObject save
]

{ #category : #operations }
ASDEDbModel >> storeUser: aUser [
	aUser save.
]

{ #category : #operations }
ASDEDbModel >> userFromLogin: aLogin andPassword: aPassword [
	^ ASDEUser
		selectOne: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDEDbModel >> users [
	^ ASDEUser selectAll
]
