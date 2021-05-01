Class {
	#name : #ASDEPlanung,
	#superclass : #Object,
	#instVars : [
		'users',
		'loggedUsers'
	],
	#classVars : [
		'WriteMutex'
	],
	#classInstVars : [
		'uniqueInstancePlanung'
	],
	#category : #'AsdEinkaufen-Core-Utils'
}

{ #category : #voyage }
ASDEPlanung class >> createAdmin [
	(ASDEUser benutzerName: 'admin' password: 'pwd' admin: true) save
]

{ #category : #'data sample' }
ASDEPlanung class >> createDemoData [
	(ASDEUser login: 'root' password: 'pwd' admin: false) save
]

{ #category : #'class initialization' }
ASDEPlanung class >> current [
	^ uniqueInstancePlanung ifNil: [ uniqueInstancePlanung := self new ]
]

{ #category : #'default values' }
ASDEPlanung class >> defaultAdminLogin [
   ^ 'admin'
]

{ #category : #'default values' }
ASDEPlanung class >> defaultAdminPassword [
   ^ 'topsecret'
]

{ #category : #'class initialization' }
ASDEPlanung class >> initialize [
	self reset
]

{ #category : #voyage }
ASDEPlanung class >> initializeLocalhostMongoDB [
	| repository |
	repository := VOMongoRepository database: 'fke'.
	repository enableSingleton
]

{ #category : #voyage }
ASDEPlanung class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDEPlanung class >> reset [
	uniqueInstancePlanung := nil.
	VORepository current reset.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDEPlanung class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDEPlanung >> addLoggedUser: aUser [
	aUser logged: true.
	aUser save.
]

{ #category : #initialization }
ASDEPlanung >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDEPlanung >> loggedUsers [
	^ ASDEUser selectMany: [ :each | each logged = true ]
]

{ #category : #accessing }
ASDEPlanung >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDEPlanung >> storeObject: aObject [
	aObject save
]

{ #category : #operations }
ASDEPlanung >> storeUser: aUser [
	aUser save.
]

{ #category : #operations }
ASDEPlanung >> userFromLogin: aLogin andPassword: aPassword [
	^ ASDEUser
		selectOne: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDEPlanung >> users [
	^ ASDEUser selectAll
]
