Class {
	#name : #ASDEDbModelPortal,
	#superclass : #ASDEDbModel,
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelPortal'
	],
	#category : #'AsdEinkaufen-Core-Utils'
}

{ #category : #voyage }
ASDEDbModelPortal class >> createAdmin [
	(ASDEUser benutzerName: 'admin' password: 'pwd' admin: true) save
]

{ #category : #'data sample' }
ASDEDbModelPortal class >> createDemoData [
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

{ #category : #'class initialization' }
ASDEDbModelPortal class >> current [
	^ uniqueInstanceDbModelPortal ifNil: [ uniqueInstanceDbModelPortal := self new ]
]

{ #category : #'default values' }
ASDEDbModelPortal class >> defaultRepository [
	^ 'fke'
]

{ #category : #'class initialization' }
ASDEDbModelPortal class >> initialize [
	self reset
]

{ #category : #voyage }
ASDEDbModelPortal class >> initializeLocalhostMongoDB [
	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDEDbModelPortal class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDEDbModelPortal class >> reset [
	uniqueInstanceDbModelPortal := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDEDbModelPortal class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDEDbModelPortal >> addLoggedUser: aUser [
	aUser logged: true.
	Repos save: aUser 
]

{ #category : #operations }
ASDEDbModelPortal >> artCategories [
	^ ASDEKategorie selectMany: [ :each | each type = 'artikelArtKategorie' ]
]

{ #category : #operations }
ASDEDbModelPortal >> artikelCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'artikelKategorie' ]
]

{ #category : #initialization }
ASDEDbModelPortal >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDEDbModelPortal >> loggedUsers [
	^ ASDEUser selectMany: [ :each | each logged = true ]
]

{ #category : #accessing }
ASDEDbModelPortal >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDEDbModelPortal >> oberCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'artikelOberKategorie' ]
]

{ #category : #operations }
ASDEDbModelPortal >> shopCategories [
	^ ASDEKategorie
		selectMany: [ :each | each type = 'shop' ]
]

{ #category : #operations }
ASDEDbModelPortal >> storeObject: aObject [
	Repos save: aObject
]

{ #category : #operations }
ASDEDbModelPortal >> storeUser: aUser [
	aUser save.
]

{ #category : #operations }
ASDEDbModelPortal >> userFromLogin: aLogin andPassword: aPassword [
	^ Repos 
		selectOne: ASDEUser
		where: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDEDbModelPortal >> users [
	^ Repos selectAll: ASDEUser 
]
