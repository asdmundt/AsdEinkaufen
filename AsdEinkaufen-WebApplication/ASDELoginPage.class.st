Class {
	#name : #ASDELoginPage,
	#superclass : #ASDEPage,
	#instVars : [
		'centerComponent',
		'loginComponent',
		'showLoginError'
	],
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDELoginPage class >> pageName [
	^ 'Login'
]

{ #category : #accessing }
ASDELoginPage class >> priority [
	^ 1
]

{ #category : #accessing }
ASDELoginPage >> centerComponent [
	^ centerComponent
]

{ #category : #accessing }
ASDELoginPage >> centerComponent: anObject [
	centerComponent := anObject
]

{ #category : #accessing }
ASDELoginPage >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialize }
ASDELoginPage >> initialize [
	 super initialize
]

{ #category : #accessing }
ASDELoginPage >> loginComponent [
	^ loginComponent
]

{ #category : #accessing }
ASDELoginPage >> loginComponent: anObject [
	loginComponent := anObject
]

{ #category : #actions }
ASDELoginPage >> loginErrorOccured [
        showLoginError := true
]

{ #category : #rendering }
ASDELoginPage >> rendeModalLoginButtonOn: html [
	html
		form: [ html
				render:
					(ASDLoginCardWidget new
						callback:
								[ :login :password | self rootComponent tryConnectionWithLogin: login andPassword: password ];
						yourself) ].
	self rootComponent 
 class development
		ifTrue: [ html anchor
				callback: [ self show: (WAInspector current on: self session) ];
				with: 'Inspect Session' ]
]

{ #category : #rendering }
ASDELoginPage >> renderContentOn: html [
	html mdlGrid
		shadow: 0;
		style: 'align-items: center; height: 100%';
		with: [ html mdlCell
				middle;
				desktopOffset: 3;
				tabletOffset: 3;
				phoneOffset: 2;
				desktopSize: 8;
				tabletSize: 5;
				phoneSize: 2;
				
				with: [ self rendeModalLoginButtonOn: html ] ]
]
