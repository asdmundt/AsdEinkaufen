Class {
	#name : #ASDArtikel,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'name',
		'titel',
		'descr',
		'artikelNr',
		'hersteller',
		'lieferant',
		'descrUrl',
		'ekPreis',
		'vkPreis',
		'artKategorie',
		'oberKategorie',
		'kategorie',
		'shopId',
		'bild',
		'tags'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #voyage }
ASDArtikel class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDArtikel class >> shopId: anInt [
	^ self new
		shopId: anInt;
		yourself
]

{ #category : #actions }
ASDArtikel >> addTag: aTag [
tags add: aTag 
	
]

{ #category : #accessing }
ASDArtikel >> artKategorie [
	^ artKategorie
]

{ #category : #accessing }
ASDArtikel >> artKategorie: anObject [
	artKategorie := anObject
]

{ #category : #accessing }
ASDArtikel >> artikelNr [
	^ artikelNr
]

{ #category : #accessing }
ASDArtikel >> artikelNr: anObject [
	artikelNr := anObject
]

{ #category : #accessing }
ASDArtikel >> bild [
	^ bild
]

{ #category : #accessing }
ASDArtikel >> bild: anObject [
	bild := anObject
]

{ #category : #accessing }
ASDArtikel >> descr [
	^ descr
]

{ #category : #accessing }
ASDArtikel >> descr: anObject [
	descr := anObject
]

{ #category : #accessing }
ASDArtikel >> descrUrl [
	^ descrUrl
]

{ #category : #accessing }
ASDArtikel >> descrUrl: anObject [
	descrUrl := anObject
]

{ #category : #accessing }
ASDArtikel >> ekPreis [
	^ ekPreis
]

{ #category : #accessing }
ASDArtikel >> ekPreis: anObject [
	ekPreis := anObject
]

{ #category : #accessing }
ASDArtikel >> hersteller [
	^ hersteller
]

{ #category : #accessing }
ASDArtikel >> hersteller: anObject [
	hersteller := anObject
]

{ #category : #initialization }
ASDArtikel >> initialize [
	super initialize.
	self tags: OrderedCollection new.
]

{ #category : #accessing }
ASDArtikel >> kategorie [
	^ kategorie
]

{ #category : #accessing }
ASDArtikel >> kategorie: anObject [
	kategorie := anObject
]

{ #category : #accessing }
ASDArtikel >> lieferant [
	^ lieferant
]

{ #category : #accessing }
ASDArtikel >> lieferant: anObject [
	lieferant := anObject
]

{ #category : #accessing }
ASDArtikel >> name [
	^ name
]

{ #category : #accessing }
ASDArtikel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDArtikel >> oberKategorie [
	^ oberKategorie
]

{ #category : #accessing }
ASDArtikel >> oberKategorie: anObject [
	oberKategorie := anObject
]

{ #category : #accessing }
ASDArtikel >> shopId [
	^ shopId
]

{ #category : #accessing }
ASDArtikel >> shopId: anObject [
	shopId := anObject
]

{ #category : #accessing }
ASDArtikel >> tags [
	^ tags
]

{ #category : #accessing }
ASDArtikel >> tags: anObject [
	tags := anObject
]

{ #category : #accessing }
ASDArtikel >> titel [
	^ titel
]

{ #category : #accessing }
ASDArtikel >> titel: anObject [
	titel := anObject
]

{ #category : #accessing }
ASDArtikel >> vkPreis [
	^ vkPreis
]

{ #category : #accessing }
ASDArtikel >> vkPreis: anObject [
	vkPreis := anObject
]
