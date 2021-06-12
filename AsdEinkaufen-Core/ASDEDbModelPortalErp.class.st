Class {
	#name : #ASDEDbModelPortalErp,
	#superclass : #ASDEDbModel,
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelPortalErp'
	],
	#category : #'AsdEinkaufen-Core-Utils'
}

{ #category : #voyage }
ASDEDbModelPortalErp class >> createAdmin [
	(ASDEUser benutzerName: 'admin' password: 'pwd' admin: true) save
]

{ #category : #'data sample' }
ASDEDbModelPortalErp class >> createDemoData [
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
ASDEDbModelPortalErp class >> current [
	^ uniqueInstanceDbModelPortalErp
		ifNil: [ uniqueInstanceDbModelPortalErp := self new ]
]

{ #category : #'default values' }
ASDEDbModelPortalErp class >> defaultRepository [
	^ 'fkeErp'
]

{ #category : #'class initialization' }
ASDEDbModelPortalErp class >> initialize [
	self reset
]

{ #category : #voyage }
ASDEDbModelPortalErp class >> initializeLocalhostMongoDB [
	
	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDEDbModelPortalErp class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDEDbModelPortalErp class >> reset [
	uniqueInstanceDbModelPortalErp := nil.
	VORepository current reset.
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDEDbModelPortalErp class >> version [
^'1.0.0'
]

{ #category : #initialization }
ASDEDbModelPortalErp >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDEDbModelPortalErp >> loggedUsers [
	^ ASDEUser selectMany: [ :each | each logged = true ]
]

{ #category : #accessing }
ASDEDbModelPortalErp >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDEDbModelPortalErp >> storeObject: aObject [
	Repos save: aObject
]

{ #category : #accessing }
ASDEDbModelPortalErp >> users [
	^ ASDEUser selectAll
]
