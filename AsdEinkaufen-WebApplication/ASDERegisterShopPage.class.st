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
	"self
		formComponent: (ASDEFormUser withModel: self user withAjax: true)"
	"
	self
		adresse:
			(ASDEFormAdresse withModel: self adresse withAjax: true).
	self
		shop: (ASDEFormShop withModel: self shop)"
]

{ #category : #rendering }
ASDERegisterShopPage >> renderAdresseOn: html [
	" "|adrForm|
adrForm := (ASDEFormAdresse withModel: self adresse withAjax: true) .
	html
		render:
			(adrForm
				onClickBlock:
					(html jQuery ajax
						callback: [ adrForm validateAndSave.
							];
						onComplete:
							((html jQuery id: self htmlId) load
								html: [ :ajaxHtml | self renderShopOn: ajaxHtml ])))
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
				
				with: [ html div
						id: self htmlId;
						with: [ self renderRegisterOn: html ] ] ]
]

{ #category : #rendering }
ASDERegisterShopPage >> renderRegisterOn: html [
	| userForm |
	userForm := ASDEFormUser withModel: self user withAjax: true.
	html
		render:
			(userForm
				onClickBlock:
					(html jQuery ajax
					serializeForm;
						callback: [ "serializeForm;"
							userForm validateAndSave.
							self session currentUser: userForm model.
							self session userId: userForm model id.
							"arg logged: true."
							userForm model inspect.
							self session model addLoggedUser: userForm model ];
						onComplete:
							((html jQuery id: self htmlId) load
								html: [ :ajaxHtml | self renderAdresseOn: ajaxHtml ];
								onComplete: 'componentHandler.upgradeElements(this);' js)))
]

{ #category : #rendering }
ASDERegisterShopPage >> renderShopOn: html [
	| shopForm |
	shopForm := ASDEFormShop withModel: self shop.
	html
		render:
			(shopForm
				callback: [ :model | shopForm validateAndSave ];
				yourself)
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
