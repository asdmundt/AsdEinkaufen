Class {
	#name : #ASDERegisterShopPage,
	#superclass : #ASDEPage,
	#instVars : [
		'register',
		'shop',
		'adresse',
		'htmlId',
		'adr'
	],
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDERegisterShopPage class >> pageName [
	^ 'Registrierung'
]

{ #category : #accessing }
ASDERegisterShopPage class >> priority [
	^ 3
]

{ #category : #actions }
ASDERegisterShopPage >> addNewAccount [
	| size obj |
	size := ASDEUser selectAll size.
	obj := self register model.
	self session model storeObject: obj.
	self session currentUser: obj.
	self session model addLoggedUser: obj.



	"self goToLoginView"
]

{ #category : #actions }
ASDERegisterShopPage >> addNewAddres [
	| obj |
	
	obj := self adresse model.
	self session model storeObject: obj.
	self goToLoginView
	"obj id: 1."
]

{ #category : #accessing }
ASDERegisterShopPage >> adr [
	^ adr
]

{ #category : #accessing }
ASDERegisterShopPage >> adr: anObject [
	adr := anObject
]

{ #category : #accessing }
ASDERegisterShopPage >> adresse [
	^ adresse
]

{ #category : #accessing }
ASDERegisterShopPage >> adresse: anObject [
	adresse := anObject
]

{ #category : #hooks }
ASDERegisterShopPage >> children [
	^ {}
]

{ #category : #actions }
ASDERegisterShopPage >> goToLoginView [
	self displayInstanceOf: ASDELoginPage 
]

{ #category : #accessing }
ASDERegisterShopPage >> htmlId [
	^ #registerComponente
]

{ #category : #initialize }
ASDERegisterShopPage >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDERegisterShopPage >> register [
	^ register
]

{ #category : #accessing }
ASDERegisterShopPage >> register: anObject [
	register := anObject
]

{ #category : #rendering }
ASDERegisterShopPage >> renderAdresseOn: html [
| addr|
addr:= ASDEFormUser withModel: ASDEAdresse new.
	html mdlCard
		id: self htmlId;
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 70%; height: 100%;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Adresse anlegen' level: 2 ].
			html
				mdlCardTextContainer: [ " " ASDEFormUser withModel: ASDEAdresse new ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderContentOn: html [
	html space.
	html mdlGrid
		shadow: 0;
		with: [ html mdlCell
				class: 'grid-cell-demo';
				desktopOffset: 3;
				tabletOffset: 3;
				phoneOffset: 2;
				desktopSize: 8;
				tabletSize: 5;
				phoneSize: 2;
				id: self htmlId;
				with: [ self renderRegisterOn: html ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderRegisterOn: html [
	| user |
	user := ASDEFormUser withModel: ASDEUser asAdmin withAjax: true.
	html mdlCard
		id: html nextId;
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 400px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ " "
					html
						render:
							(user
								onClickBlock:
									((html jQuery id: self htmlId) load
										html: [ :ajaxHtml | 
											self session model storeObject: user model.
											self renderAdresseOn: ajaxHtml ];
										onComplete: 'componentHandler.upgradeDom();' js)) ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderShopOn: html [
	html space.
	html
		form: [ html mdlCard
				shadow: 2;
				mdlTypographyTextLeft;
				style: 'width: 70%; height: 100%;';
				with: [ html mdlCardTitleContainer
						with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
					html mdlCardTextContainer: [ " " html render: self shop ].
					html mdlCardActions
						border;
						with: [ html div
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
										callback: [ self addNewAccount ];
										with: 'speichern' ] ] ] ]
]

{ #category : #accessing }
ASDERegisterShopPage >> shop [
	^ shop
]

{ #category : #accessing }
ASDERegisterShopPage >> shop: anObject [
	shop := anObject
]
