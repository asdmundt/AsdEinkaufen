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
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'AsdEinkaufen'.
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												with: label ] ] ] ].
			html
				mdlMiniFooterRightSection: [ html
						mdlMiniFooterLinkList: [ html listItem: [ html text: 'Contact: oo' ] ] ] ]
]
