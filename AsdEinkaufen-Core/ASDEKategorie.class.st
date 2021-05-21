Class {
	#name : #ASDEKategorie,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'name',
		'type',
		'types'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #voyage }
ASDEKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDEKategorie class >> name: aName andType: aString [
	^ self new
		name: aName;
		type: aString;
		yourself
]

{ #category : #accessing }
ASDEKategorie >> name [
	^ name
]

{ #category : #accessing }
ASDEKategorie >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDEKategorie >> type [
	^ type
]

{ #category : #accessing }
ASDEKategorie >> type: anObject [
	type := anObject
]

{ #category : #accessing }
ASDEKategorie >> types [
	^ OrderedCollection
		newFrom: {'shop' . 'artikelArtKategorie' . 'artikelOberKategorie' . 'artikelKategorie'}.
]
