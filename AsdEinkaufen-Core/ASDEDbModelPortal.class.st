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
	"(ASDEUser benutzerName: 'shop' password: 'xyz' admin: false)
		asShopOwner save."

	Repos save: (ASDEKategorie name: 'Elektronik' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Baumarkt' andType: 'shop' ).
	Repos save: (ASDEKategorie name: 'Textilien' andType: 'shop' ).
	Repos save: (ASDEKategorie name: 'SecondHand' andType: 'shop' ).
	Repos save: (ASDEKategorie name: 'Moebel' andType: 'shop' ).
	Repos save: (ASDEKategorie name: 'Werkzeug' andType: 'shop' ).
	Repos
		save: (ASDEKategorie
		name: 'Multimedia'
		andType: 'artikelArtKategorie' ).
	Repos
		save: (ASDEKategorie
		name: 'Computer'
		andType: 'artikelArtKategorie' ).
	Repos
		save: (ASDEKategorie
		name: 'ComputerKomponenten'
		andType: 'artikelArtKategorie' ).
	Repos
		save: (ASDEKategorie name: 'Lampen' andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Moebel' andType: 'artikelArtKategorie').
	Repos
		save:
			(ASDEKategorie
				name: 'ElektronikKomponenten'
				andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Boxen' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Reciever' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Mp3Player' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'TV' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Satelit' andType: 'artikelOberKategorie').
	Repos
		save:
			(ASDEKategorie
				name: 'ElektronikKomponenten'
				andType: 'artikelOberKategorie')
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

{ #category : #operations }
ASDEDbModelPortal >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #initialization }
ASDEDbModelPortal >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDEDbModelPortal >> loggedUsers [
	^Repos selectMany: ASDEUser where: [ :each | each logged = true ]
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
	^ Repos  selectMany: ASDEKategorie where: [ :each | each type = 'shop' ]
]

{ #category : #accessing }
ASDEDbModelPortal >> shopCount [
	^ Repos  count: ASDEShop 
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
