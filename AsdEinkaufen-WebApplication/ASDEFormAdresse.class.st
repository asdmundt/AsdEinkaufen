Class {
	#name : #ASDEFormAdresse,
	#superclass : #ASDEForm,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #initalize }
ASDEFormAdresse >> initialize [
	super initialize.
	
]

{ #category : #rendering }
ASDEFormAdresse >> renderBezOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Bez'.
			html mdlTextFieldInput
				id: html lastId;
				
				value: model ]
]

{ #category : #rendering }
ASDEFormAdresse >> renderContentOn: html [
	 self renderFormContentOn: html 
]

{ #category : #rendering }
ASDEFormAdresse >> renderFieldsOn: html [

]

{ #category : #rendering }
ASDEFormAdresse >> renderFormContentOn: html [
	self renderFieldsOn: html.
	self isDialog ifFalse: [ self renderCancelButtonOn: html.
	self renderSubmitButtonOn: html ]
	
]

{ #category : #rendering }
ASDEFormAdresse >> renderSubmitButtonOn: html [
self isAjax ifTrue: [ html mdlButton
		raised;
		accentColor;
		beSubmit;
		class: 'mdl-button mdl-js-button mdl-button--raised';
		with: 'ok' ] ifFalse: [ html mdlButton
		raised;
		accentColor;
		beSubmit;
		class: 'mdl-button mdl-js-button mdl-button--raised';
		with: 'ok' ]
	
]
