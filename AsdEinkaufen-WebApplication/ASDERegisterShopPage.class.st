Class {
	#name : #ASDERegisterShopPage,
	#superclass : #ASDEPage,
	#instVars : [
		'register',
		'shop',
		'adresse',
		'htmlId'
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
	self register descriptions inspect.
	obj := self register model.
	obj save.
	
	obj save

	"self goToLoginView"
]

{ #category : #actions }
ASDERegisterShopPage >> addNewAddres [
	| obj |
	
	self adresse save.
	obj := self adresse model.
	obj save.
	"obj id: 1."
	obj save
	"self goToLoginView"
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
	^ {self register }
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
	self register: ASDEUser asAdmin asComponent yourself.
	self adresse: ASDEAdresse new asComponent addValidation yourself.
	self shop: ASDEShop new asComponent addValidation yourself
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
	html
		form: [ html mdlCard
				shadow: 2;
				mdlTypographyTextLeft;
				style: 'width: 70%; height: 100%;';
				with: [ html mdlCardTitleContainer
						with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
					html mdlCardTextContainer: [ " " html render: self adresse ].
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
										with: 'speichern'.
									html mdlButton
										raised;
										primaryColor;
										onClick:
											(html jQuery ajax
												callback: [ self addNewAddres ];
												onComplete:
													((html jQuery id: self htmlId) load
														html: [ :ajaxHtml | self renderShopOn: ajaxHtml ]));
										with: 'speichern' ] ] ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderContentOn: html [
	html space.
	 self renderRegisterOn: html
]

{ #category : #rendering }
ASDERegisterShopPage >> renderRegisterOn: html [
	html
		form: [ html mdlCard
				shadow: 2;
				mdlTypographyTextLeft;
				style: 'width: 70%; height: 100%;';
				with: [ html mdlCardTitleContainer
						with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
					html mdlCardTextContainer: [ " " html render: self register ].
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
										with: 'speichern'.
									html mdlButton
										raised;
										primaryColor;
										onClick:
											(html jQuery ajax
												callback: [ self addNewAccount ];
												onComplete:
													((html jQuery id: self htmlId) load
														html: [ :ajaxHtml | self renderAdresseOn: ajaxHtml ]));
										with: 'speichern' ] ] ] ]
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
