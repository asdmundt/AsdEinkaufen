Class {
	#name : #ASDEAdresse,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'bez',
		'str',
		'hsnr',
		'plz',
		'ort',
		'land',
		'tel',
		'bemerkung',
		'userId'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #'instance creation' }
ASDEAdresse class >> bez: aBez [
	^ self new
		bez: aBez;
		yourself
]

{ #category : #'instance creation' }
ASDEAdresse class >> bez: aBez andUserId: anInteger [ 
	^ self new
		bez: aBez;
		userId: anInteger;
		yourself
]

{ #category : #voyage }
ASDEAdresse class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDEAdresse >> bemerkung [
	^ bemerkung
]

{ #category : #accessing }
ASDEAdresse >> bemerkung: anObject [
	bemerkung := anObject
]

{ #category : #accessing }
ASDEAdresse >> bez [
	^ bez
]

{ #category : #accessing }
ASDEAdresse >> bez: anObject [
	bez := anObject
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionBemerkung [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Bemerkung';
		accessor: #bemerkung;
		priority: 8;
		required: false;
		
		comment: 'Hier können Sie eine Bemerkung eingeben';
		componentClass: MDLMATextAreaComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionBez [
	<magritteDescription>
	^ MAStringDescription new
	label: 'Bezeichnung';
		accessor: #bez;
		priority: 1;
		required: true;
		requiredErrorMessage: 'Bitte die Bezeichnung eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionHsnr [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Hausnummer';
		accessor: #hsnr;
		priority: 2;
		required: true;
		requiredErrorMessage: 'Bitte die Hausnummer eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionOrt [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Ort';
		accessor: #ort;
		priority: 4;
		required: true;
		requiredErrorMessage: 'Bitte die Ort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionPlz [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Postleitzahl';
		accessor: #plz;
		priority: 3;
		required: true;
		requiredErrorMessage: 'Bitte die Postleitzahl eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionStr [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Strassen Namen';
		accessor: #str;
		priority: 1;
		required: true;
		requiredErrorMessage: 'Bitte die Strasse eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDEAdresse >> descriptionTel [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Telefon Nummer';
		accessor: #tel;
		priority: 5;
		required: true;
		requiredErrorMessage: 'Bitte die Telefon Nummer eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDEAdresse >> hsnr [
	^ hsnr
]

{ #category : #accessing }
ASDEAdresse >> hsnr: anObject [
	hsnr := anObject
]

{ #category : #initialization }
ASDEAdresse >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEAdresse >> land [
	^ land
]

{ #category : #accessing }
ASDEAdresse >> land: anObject [
	land := anObject
]

{ #category : #accessing }
ASDEAdresse >> ort [
	^ ort
]

{ #category : #accessing }
ASDEAdresse >> ort: anObject [
	ort := anObject
]

{ #category : #accessing }
ASDEAdresse >> plz [
	^ plz
]

{ #category : #accessing }
ASDEAdresse >> plz: anObject [
	plz := anObject
]

{ #category : #accessing }
ASDEAdresse >> str [
	^ str
]

{ #category : #accessing }
ASDEAdresse >> str: anObject [
	str := anObject
]

{ #category : #accessing }
ASDEAdresse >> tel [
	^ tel
]

{ #category : #accessing }
ASDEAdresse >> tel: anObject [
	tel := anObject
]

{ #category : #accessing }
ASDEAdresse >> userId [
	^ userId
]

{ #category : #accessing }
ASDEAdresse >> userId: anObject [
	userId := anObject
]
