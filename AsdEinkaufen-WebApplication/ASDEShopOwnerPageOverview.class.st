Class {
	#name : #ASDEShopOwnerPageOverview,
	#superclass : #ASDEPageShopOwner,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEShopOwnerPageOverview class >> pageName [
	^ 'Shop'
]

{ #category : #accessing }
ASDEShopOwnerPageOverview class >> priority [
	^ 1
]

{ #category : #initalize }
ASDEShopOwnerPageOverview >> initialize [
	super initialize.
	self session rootComponent header: ASDEHeaderShopOwner new
]

{ #category : #rendering }
ASDEShopOwnerPageOverview >> renderCategorytestOn: html [
	| selected |

	html div
		id: 'selectWithAjaxId';
		with: 'Selected object: 3'.
	html
		form: [ html
				render:
					((MDLSelectWidget
						possibilities: #(1 2 3 4 5)
						inputLabel: 'Select Your Number'
						labelBlock: #asString
						callback: [ :input | selected := input ]
						selectedObject: 3
						tooltip: 'description'
						sortBlock: [ :a :b | a <= b ])
						entryTooltip: [ :number | 'Choose number: ' , number asString ];
						customizationBlock: [ :textField :renderer | 
							textField
								onChange:
									(html jQuery ajax serializeThis
										onComplete:
											((html jQuery id: 'selectWithAjaxId') load
												html: [ :canvas | canvas text: 'Selected object: ' , selected asString ])) ];
						yourself) ]
]

{ #category : #rendering }
ASDEShopOwnerPageOverview >> renderContentOn: html [
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
				with: [ self renderCategorytestOn: html ] ]
]

{ #category : #rendering }
ASDEShopOwnerPageOverview >> renderShopOn: html [
	" "

	| shopForm |
	shopForm := ASDEFormShop withModel: self shop.
	html
		render:
			(shopForm
				callback: [ :model | 
					self session model storeObject: model.
					self rootComponent goToShopView ])
]

{ #category : #rendering }
ASDEShopOwnerPageOverview >> renderTaskOn: html [
	html mdlCard
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 70%; height: 100%;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
			html mdlCardTextContainer: [ " "  html
				definitionList: [ html definitionTerm: 'Material Design'.
					html
						definitionData: [ html
								paragraph: [ html
										text:
											'Material Design Lite (MDL) is a library of components for web developers based on Google''s Material Design Philosophy: "A visual language for our users that synthesizes the classic principles of good design with the innovation and possibility of technology and science." Understanding the goals and principles of Material Design is critical to the proper use of the Material Design Lite components. If you have not yet read the '.
									html anchor
										url: 'https://material.io/guidelines/material-design/';
										target: '_blank';
										with: 'Material Design Introduction'.
									html
										text: ' you should do so before attempting to use the components.' ] ] ]  ] ]
]
