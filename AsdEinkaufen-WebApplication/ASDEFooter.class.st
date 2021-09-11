"
Description
--------------------

A footer for the application with all the useful links.
"
Class {
	#name : #ASDEFooter,
	#superclass : #ASDEComponent,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEFooter >> links [
	^ OrderedDictionary
		with: 'MDL for Seaside' -> 'https://github.com/DuneSt/MaterialDesignLite'
		with: 'Pharo' -> 'http://pharo.org/'
		with: 'Seaside' -> 'https://github.com/SeasideSt/Seaside'
		with: 'oosystems' -> 'https://github.com/SeasideSt/Seaside'
]

{ #category : #rendering }
ASDEFooter >> renderContentOn: html [
	html mdlMiniFooter
		style: 'position:absolute;left: 0px;bottom: 0px;width: 100%;';
		with: [ html
				mdlMiniFooterLeftSection: [ self rootComponent class development
						ifTrue: [ html
								mdlLogo:
									'EinkaufenInFrankfurt' , '      Version   '
										, self rootComponent class version ]
						ifFalse: [ html mdlLogo: 'EinkaufenInFrankfurt'].
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												with: label ] ] ] ].
			html
				mdlMiniFooterRightSection: [ html
						mdlMiniFooterLinkList: [ html listItem: [ html text: 'Contact: TODO' ] ] ] ]
]
