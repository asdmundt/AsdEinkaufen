Class {
	#name : #ASDEForm,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'model',
		'display',
		'dom',
		'isAjax',
		'callback',
		'onClickBlock'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel [
	^ self new
		model: aModel;
		display: false
]

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel andDom: aDom [
	^ self new
		model: aModel;
		dom: aDom;
		display: false
]

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel andOnClickBlock: aBlock [
	^ self new
		model: aModel;
		onClickBlock: aBlock;
		isAjax: true
]

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel asDisplay: aBoolean [ 
	^ self new
		model: aModel;
		display: aBoolean;
		yourself
]

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel withAjax: aBoolean [
	^ self new
		model: aModel;
		isAjax: aBoolean
]

{ #category : #accessing }
ASDEForm >> callback [
	^ callback
]

{ #category : #accessing }
ASDEForm >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
ASDEForm >> display [
	^ display
]

{ #category : #accessing }
ASDEForm >> display: anObject [
	display := anObject
]

{ #category : #accessing }
ASDEForm >> dom [
	^ dom
]

{ #category : #accessing }
ASDEForm >> dom: anObject [
	dom := anObject
]

{ #category : #initalize }
ASDEForm >> initialize [
	super initialize.
	self isAjax: false.
]

{ #category : #accessing }
ASDEForm >> isAjax [
	^ isAjax
]

{ #category : #accessing }
ASDEForm >> isAjax: anObject [
	isAjax := anObject
]

{ #category : #accessing }
ASDEForm >> model [
	^ model
]

{ #category : #accessing }
ASDEForm >> model: anObject [
	model := anObject
]

{ #category : #accessing }
ASDEForm >> onClickBlock [
	^ onClickBlock
]

{ #category : #accessing }
ASDEForm >> onClickBlock: anObject [
	onClickBlock := anObject
]

{ #category : #rendering }
ASDEForm >> renderAjaxButtonOn: html [
	html div
		class: 'mdl-typography--text-right';
		with: [ html mdlButton
				raised;
				rippleEffect;
				with: 'abbrechen'.
			html space.
			html mdlButton
				raised;
				primaryColor;
				beSubmit;
					bePush;
				onClick: self onClickBlock;
				with: 'speichern' ]
]

{ #category : #rendering }
ASDEForm >> renderButtonOn: html [
	html div
		class: 'mdl-typography--text-right';
		with: [ html mdlButton
				raised;
				rippleEffect;
				with: 'abbrechen'.
			html space.
			html mdlButton
				raised;
				primaryColor;
				beSubmit;
				callback: [ callback value: model ];
				with: 'ok' ]
]

{ #category : #rendering }
ASDEForm >> renderContentOn: html [
html form: [
	self renderFieldsOn: html.
	self isAjax
		ifTrue: [ self renderAjaxButtonOn: html ]
		ifFalse: [ self renderButtonOn: html ]]
]

{ #category : #rendering }
ASDEForm >> renderFieldsOn: html [
self subclassResponsibility
	
]

{ #category : #actions }
ASDEForm >> validateAndSave [
	
	self session model storeObject: self model
]
