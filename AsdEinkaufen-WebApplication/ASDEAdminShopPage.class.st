Class {
	#name : #ASDEAdminShopPage,
	#superclass : #ASDEPageAdmin,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEAdminShopPage class >> pageName [
	^ 'Shop Verwaltung'
]

{ #category : #accessing }
ASDEAdminShopPage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDEAdminShopPage >> renderContentOn: html [
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
				with: [ html text: 'khjkhkhjh' ] ]
]
