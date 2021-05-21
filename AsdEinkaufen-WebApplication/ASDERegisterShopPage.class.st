Class {
	#name : #ASDERegisterShopPage,
	#superclass : #ASDEPage,
	#instVars : [
		'htmlId',
		'formComponent',
		'user',
		'adresse',
		'shop'
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

{ #category : #accessing }
ASDERegisterShopPage >> formComponent [
	^ formComponent
]

{ #category : #accessing }
ASDERegisterShopPage >> formComponent: anObject [
	formComponent := anObject
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
	self user: ASDEUser new.
	self user asShopOwner.
	self
		adresse: (ASDEAdresse bez: 'Shop Adresse' andUserId: self user id).
	self shop: (ASDEShop userId: self user id).
	self
		formComponent: (ASDEFormUser withModel: self user withAjax: true)
	"
	self
		adresse:
			(ASDEFormAdresse withModel: self adresse withAjax: true).
	self
		shop: (ASDEFormShop withModel: self shop)"
]

{ #category : #rendering }
ASDERegisterShopPage >> renderAdresseOn: html [
	html mdlCard
		id: html nextId;
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 500px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Adresse anlegen' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ " "
					html
						render:
							(self adresse
								onClickBlock:
									(html jQuery ajax
										callback: [ self adresse validateAndSave ];
										onComplete:
											((html jQuery id: self htmlId) load
												html: [ :ajaxHtml | self renderShopOn: ajaxHtml ];
												onComplete: 'componentHandler.upgradeDom();' js))) ] ]
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
				with: [ html
						render:
							(self formComponent
								onClickBlock:
									(html jQuery ajax
										callback: [ self formComponent validateAndSave.
											self
												formComponent: (ASDEFormAdresse withModel: self adresse withAjax: true) ];
										onComplete:
											((html jQuery id: self htmlId) load
												html: [ :ajaxHtml | 
													ajaxHtml
														render:
															(self formComponent
																onClickBlock:
																	(html jQuery ajax
																		callback: [ self formComponent validateAndSave.
																				"(ASDEFormShop withModel: self shop)" ];
																		onComplete:
																			((html jQuery id: self htmlId) load
																				html: [ :rHtml | 
																					self formComponent: DateAndTime now.
																					rHtml render: self formComponent ]))) ]))) ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderRegisterOn: html [
	| user reg |
	user := ASDEUser new.
	user asShopOwner.
	reg := ASDEFormUser withModel: user withAjax: true.
	html mdlCard
		id: self htmlId;
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
							(reg
								onClickBlock:
									((html jQuery id: self htmlId) load
										html: [ :ajaxHtml | 
											reg validateAndSave.
											self renderAdresseOn: html ])) ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderShopOn: html [
	html space.
	html mdlCard
		shadow: 2;
		mdlTypographyTextLeft;
		id: self htmlId;
		style: 'width: 70%; height: 100%;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
			html mdlCardTextContainer: [ " " html render: self shop ] ]
]

{ #category : #accessing }
ASDERegisterShopPage >> shop [
	^ shop
]

{ #category : #accessing }
ASDERegisterShopPage >> shop: anObject [
	shop := anObject
]

{ #category : #accessing }
ASDERegisterShopPage >> user [
	^ user
]

{ #category : #accessing }
ASDERegisterShopPage >> user: anObject [
	user := anObject
]
